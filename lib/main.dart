import 'package:flutter/material.dart';
import 'package:salotech/screens/WelcomePage.dart';

void main() async {
  runApp(const MaterialApp(
      home: SApp()));
}

class SApp extends StatelessWidget {
  const SApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomePage(),
    );
  }
}
