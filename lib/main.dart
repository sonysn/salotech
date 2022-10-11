import 'package:flutter/material.dart';
import 'package:salotech/screens/WelcomePage.dart';

import 'database/dbhelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
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
