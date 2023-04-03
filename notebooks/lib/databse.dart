import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

 class Mydatabase
{
  Future<void> forcreatedatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'database.db');

    Database database = await openDatabase(path, version: 1,
    onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE data (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, EMAIL TEXT,PASSWORD TEXT )');
  }

}