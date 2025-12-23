import 'package:flutter_components_lab/pages/select_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyCounterApp());
}

class MyCounterApp extends StatelessWidget {
  const MyCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: false,
        textTheme: TextTheme(
          labelLarge: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: MySelectTheColor(),
    );
  }
}