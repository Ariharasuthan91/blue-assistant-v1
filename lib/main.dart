import 'package:flutter/material.dart';

void main() {
  runApp(const BlueAssistantApp());
}

class BlueAssistantApp extends StatelessWidget {
  const BlueAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blue Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blue Assistant")),
      body: const Center(child: Text("Welcome to Blue Assistant")),
    );
  }
}