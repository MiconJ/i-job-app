import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijob_app/screens/list_agency.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    title: 'i-Job.vn',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(16, 136, 89, 100)),
      useMaterial3: true,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    home: const ListAgency(),
  )));
}
