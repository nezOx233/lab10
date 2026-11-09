
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 10 - Navigation',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF73549A),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFCEB5F4),
          foregroundColor: Colors.black87,
          centerTitle: true,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
