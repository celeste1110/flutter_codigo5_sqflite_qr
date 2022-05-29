import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/license_model.dart';

class DBAdmin {
  Database? _myDatabase;
  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  Future<Database?> getDatabase() async {
    if (_myDatabase != null) {
      return _myDatabase;
    }
    _myDatabase = await initDB();
    return _myDatabase;
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "LicenseDB.db");
    return openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE LICENSES(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, dni TEXT, url TEXT)");
    });
  }
  getInfo() async{
    final db=await getDatabase();
    List res= await db!.query(("LICENSES"));
    return res;
  }
  Future<List>getLicenses() async{
    final db=await getDatabase();
    List res= await db!.query(("LICENSES"));
    return res;
  }
  Future<List<LicenseModel>>getLicenses2() async{
    List<LicenseModel> licenses = [];
    final Database? db=await getDatabase();
    List res= await db!.query("LICENSES",orderBy: "id DESC");
    licenses = res
        .map<LicenseModel>((model) => LicenseModel.fromJson(model))
        .toList();
    return licenses;
  }

  Future<int>insertLicenses(LicenseModel model) async {
    final db = await getDatabase();
    int res = await db!.insert(
      "LICENSES",model.toJson()
      // {
      //   "name":"Celeste Acosta",
      //   "dni":"70015330",
      //   "url":"https://carnetvacunacion.minsa.gob.pe/#publico/certificado/index?Tk=v3-J4cMCIPqW7QWLX5wFJPZiZTc637whHDP5NcoPhJXKxU=",
      //
      // },
    );
    return res;
  }
}
