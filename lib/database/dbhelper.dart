import 'dart:developer';
import 'package:salotech/database/db_environment.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
  static var db, userCollection;
  static connect() async {
    db = await Db.create(envURI);
    await db.open();
    inspect(db);
    userCollection = db.collection(envCollection);
  }
}