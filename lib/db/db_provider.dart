import 'dart:io';

import 'package:ios_app_group/ios_app_group.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if(_database != null)
      return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory sharedDirectory = await IosAppGroup.getAppGroupDirectory('group.magasin.db');
    String path = join(sharedDirectory.path, "test.db");
    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Photos ("
          "id INTEGER PRIMARY KEY, "
          "albumId INTEGER,"
          "title TEXT,"
          "url TEXT,"
          "thumbnailUrl TEXT"
          ")");
    });
  }
}