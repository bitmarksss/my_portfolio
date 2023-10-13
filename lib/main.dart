import 'package:flutter/material.dart';
import 'package:portfolio/screens/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Porfolio",
      theme: ThemeData(
        fontFamily: 'SF Pro Regular',
        textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PortfolioDashboard(),
    );
  }
}
