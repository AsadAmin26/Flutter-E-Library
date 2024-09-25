import 'package:e_library/screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eBook Reader',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.cyan,
            centerTitle: true,
            titleTextStyle: TextStyle(
                letterSpacing: 2.0,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: HomeScreen(),
    );
  }
}
