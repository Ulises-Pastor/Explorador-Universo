import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'services/nasa_api_service.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [Provider<NasaApiService>(create: (_) => NasaApiService())],
      child: const ExploradorApp(),
    ),
  );
}

class ExploradorApp extends StatelessWidget {
  const ExploradorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explorador del Universo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F1C),
        primaryColor: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple[800],
          elevation: 4,
          centerTitle: true,
          titleTextStyle: GoogleFonts.orbitron(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        textTheme: GoogleFonts.robotoCondensedTextTheme(
          ThemeData.dark().textTheme,
        ).copyWith(
          bodyLarge: const TextStyle(color: Colors.white70),
          titleLarge: const TextStyle(color: Colors.white),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
        ),
        cardColor: const Color(0xFF1E1E2E),
      ),
      home: Explorador(),
    );
  }
}

class Explorador extends StatelessWidget {
  const Explorador({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()],
        ),
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 37, 0, 37),
          child: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.home_outlined), text: 'Inicio'),
              Tab(icon: Icon(Icons.newspaper), text: 'Noticias'),
              Tab(icon: Icon(Icons.image_outlined), text: 'Imagenes'),
              Tab(
                icon: Icon(Icons.favorite_border_outlined),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
