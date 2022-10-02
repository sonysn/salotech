import 'dart:async';
import 'package:mysql1/mysql1.dart';
import 'db_environment.dart';


// Function to connect to the database
var settings  = ConnectionSettings(
    host: envHost,
    port: envPort,
    user: envUser,
    password: envPassword,
    db: envDB,
);

Future dbController() async{
      final conn = await MySqlConnection.connect(settings);
      print("${settings.port} number");
}