import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Store App', style: TextStyle(fontSize: 24)),
        ),
        body: const Center(child: Text('naaaaaaaa')),
      ),
    );
  }
}
