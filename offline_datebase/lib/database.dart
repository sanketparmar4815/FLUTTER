import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase {
  static bool right = false;

  Future<Database> ForGetDataBase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'munewdata.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE data (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, EMAIL TEXT,PASSWORD TEXT )');

      await db.execute(
          'CREATE TABLE Pdata (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, CONTACTNUBER TEXT,USERID INTEGER )');
    });
    return database;
  }

  Future<void> insertdata(
      String name, String email, Database database, String passwd) async {
    print(
        "-----------------------------------$database-------------------------");
    String insertsql =
        "INSERT INTO data (NAME,EMAIL,PASSWORD) VALUES('$name','$email','$passwd')";
    int a = await database!.rawInsert(insertsql);
  }

  Future<List<Map>> forlogindata(
      String Email, String passs, Database database) async {
    String verify =
        "Select * from data where EMAIL = '$Email' and PASSWORD='$passs'";
    List<Map> ll = await database.rawQuery(verify);
    print("--------------------------------------------------${ll}");
    return ll;
  }

  Future<void> insertpersonaldata(
      String name, String contactnumber, Database database, id) async {
    String perdata =
        "INSERT INTO Pdata (NAME,CONTACTNUBER,USERID) VALUES('$name','$contactnumber','$id')";
    int ll1 = await database.rawInsert(perdata);
    // int b = await database!.rawInsert(ll1);
  }

  Future<List<Map>> viewpersonaldata(Database db1, int? id) async {
    String pdview = "SELECT * FROM Pdata where USERID='$id'";
    List<Map> Lpdview = await db1.rawQuery(pdview);
    return Lpdview;
  }
}








