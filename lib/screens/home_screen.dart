import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/nasa_api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    final nasaService = Provider.of<NasaApiService>(context, listen: false);
    if (!nasaService.cargado) {
      nasaService.fetchApod();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Imagen del dia",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0, // Sombra del AppBar
        actions: [],
      ),
      body: Consumer<NasaApiService>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (!provider.cargado) {
            return Center(
              child: Text('No se ha podido cargar la imagen del dia'),
            );
          }
          if (provider.cargado) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: const Color.fromARGB(
                  184,
                  64,
                  11,
                  75,
                ), // o el color que prefieras
                onPressed: () async {
                  await Provider.of<NasaApiService>(
                    context,
                    listen: false,
                  ).toggleFavoriteStatus(provider.apodDeHoy);
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Icon(
                    provider.favoritesApod.contains(provider.apodDeHoy)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    key: ValueKey<bool>(
                      provider.favoritesApod.contains(provider.apodDeHoy),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      provider.apodDeHoy.title,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(provider.apodDeHoy.imageUrl),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      provider.apodDeHoy.explanation,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20), // deja espacio para el FAB
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text('No se ha podido cargar la imagen del dia'),
            );
          }
        },
      ),
    );
  }
}
