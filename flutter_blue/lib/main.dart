import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(BlueApp());
}

class BlueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blue Assistant',
      theme: ThemeData(
        primaryColor: Color(0xFF001F3F),
        accentColor: Color(0xFF00BFFF),
      ),
      home: HomeScreen(),
    );
  }
}
