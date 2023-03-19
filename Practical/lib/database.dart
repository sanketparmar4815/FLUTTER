import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDataBase
{
  Future<Database> forgetdatabase() async {
// Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Test (ID INTEGER PRIMARY KEY, name TEXT, email TEXT, date TEXT)');
        });
    return database;
  }

  Future<void> insertdata(String Na1, String Em1, String Da1, Database? db) async {

    String idata =  "INSERT INTO Test (name,email,date) VALUES('$Na1','$Em1','$Da1')";
    var a = await db?.rawInsert(idata);

  }

  Future<List<Map>> forlogindata(String em2, String da2, Database db) async {
    String verify =
        "Select * from Test where email = '$em2' and date='$da2'";
    List<Map> ll = await db.rawQuery(verify);
return ll;
  }

}