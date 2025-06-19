import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/nasa_api_service.dart';
//import '../screens/space_details.dart

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos', style: TextStyle(fontSize: 22)),
        elevation: 0,
        leading:
            Navigator.canPop(context)
                ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () => Navigator.pop(context),
                )
                : null,
      ),
      body: Consumer<NasaApiService>(
        builder: (context, apodProviders, child) {
          final favoriteApod = apodProviders.favoritesApod;
          return favoriteApod.isEmpty
              ? Center(child: Text("No hay imagenes favoritas."))
              : ListView.builder(
                itemCount: favoriteApod.length,
                itemBuilder: (context, index) {
                  return _apodCard(context, favoriteApod[index]);
                },
              );
        },
      ),
    );
  }

  Widget _apodCard(BuildContext context, dynamic apod) {
    return GestureDetector(
      onTap: () {
        // Aquí puedes agregar navegación o acción
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Theme.of(context).cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  apod.imageUrl,
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
              // Contenido de texto
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      apod.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      apod.explanation,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
