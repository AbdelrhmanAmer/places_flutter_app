import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places_app/screens/places_screen.dart';

final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 99, 8, 246),
    background: const Color.fromARGB(255, 57, 47, 68),
    brightness: Brightness.dark
);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        colorScheme: colorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: colorScheme.background,
        textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
          titleSmall: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
          titleMedium: GoogleFonts.ubuntuCondensed( fontWeight: FontWeight.bold),
          titleLarge: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold)
        )
      ),
      home: const PlacesScreen(),
    );
  }
}

