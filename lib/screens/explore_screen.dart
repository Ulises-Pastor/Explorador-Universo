import 'package:explorador_universo/models/objeto.dart';
import 'package:explorador_universo/screens/space_details.dart';
import 'package:flutter/material.dart';
import '../data/objects_data.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final planets = SpaceData.getPlanets();
    final galaxies = SpaceData.getGalaxies();
    final satellites = SpaceData.getSatellites();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exploración Espacial"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Planetas',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 420,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: planets.length,
                itemBuilder: (context, index) {
                  final planet = planets[index];
                  return _spaceCard(context, planet);
                },
              ),
            ),
            const SizedBox(height: 25),

            Text(
              'Galaxias',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 420,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: galaxies.length,
                itemBuilder: (context, index) {
                  final galaxy = galaxies[index];
                  return _spaceCard(context, galaxy);
                },
              ),
            ),
            const SizedBox(height: 25),

            Text(
              'Satelites',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Carrusel horizontal de planetas
            SizedBox(
              height: 420,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: satellites.length,
                itemBuilder: (context, index) {
                  final satelite = satellites[index];
                  return _spaceCard(context, satelite);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _spaceCard(BuildContext context, dynamic object) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => SpaceDetails(recipesData: Objeto.fromJson(object)),
          ),
        );
      },
      child: Container(
        width: 300,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 68, 66, 66).withValues(),
              blurRadius: 1,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen grande
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                object['image']!,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        object['name']!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      object['description']!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
