
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blue Assistant',
      home: Scaffold(
        appBar: AppBar(title: Text('Blue Assistant')),
        body: Center(child: Text('Welcome to Blue Assistant!')),
      ),
    );
  }
}
