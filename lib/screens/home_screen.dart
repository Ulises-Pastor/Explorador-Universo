import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/apod.dart';
import '../services/nasa_api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Apod> _apodFuture;

  @override
  void initState() {
    super.initState();
    final nasaService = Provider.of<NasaApiService>(context, listen: false);
    _apodFuture = nasaService.fetchApod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Explorador del Universo",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(
          255,
          37,
          0,
          37,
        ), // Color de fondo personalizado
        elevation: 4, // Sombra del AppBar
        leading: const Icon(
          Icons.public,
          color: Colors.white,
        ), // Ícono a la izquierda
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Acción para favoritos
            },
          ),
        ],
      ),
      body: FutureBuilder<Apod>(
        future: _apodFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final apod = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Imagen del Día',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(apod.imageUrl),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    apod.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(apod.explanation),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No se pudo cargar la imagen.'));
          }
        },
      ),
    );
  }
}
