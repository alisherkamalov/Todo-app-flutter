import 'package:flutter/material.dart';
import 'package:mpf_app/appbar.dart';
import 'package:mpf_app/bodyapp.dart';
void main() {
  runApp(const FlutterApp());
}


class FlutterApp extends StatelessWidget {
  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: HeaderApp(),
        body: BodyApp(),
      ),
    );
  }
}
