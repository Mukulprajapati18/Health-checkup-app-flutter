import 'package:flutter/material.dart';
import 'package:health_checkup_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        appBarTheme: const AppBarTheme()
      ),
      home: const homeScreen(),
    );
  }
}