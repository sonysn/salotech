import 'dart:io';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

//String Mongo_Db_URI = "mongodb://192.168.100.43:27017/";

void readDB() async {
  var port = 4000;
  var dbName = "local";
  var localhostIP = "192.168.100.43";

  var server = await HttpServer.bind("localhost", port);
  var db = Db("mongodb://localhost:27017/$dbName");
  // var db = Db("mongodb://192.168.100.43:27017/");
  await db.open();
}
