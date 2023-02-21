// import 'dart:io';

// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   //variables
//   static const dbName = "leaveDatabase.db";
//   static const dbVersion = 1;
//   static const dbTable = "Role";
//   static const columnId = "id";
//   static const columnName = "Role_Name";

//   //constructor
//   static final DatabaseHelper instance = DatabaseHelper();

//   //database initialization
//   static Database? _database;

//   Future<Database?> get database async {
//     _database ??= await initDB();
//     return _database;

//     // if (database != null) return _database;
//     // _database = await initDB();
//     // return _database;
//   }

//   initDB() async {
//     Directory directoryL = await getApplicationDocumentsDirectory();
//     String path = join(directoryL.path, dbName);
//     return await openDatabase(path, version: dbVersion, onCreate: onCreate);
//   }

//   Future onCreate(Database dbL, int version) async {
//     dbL.execute('''
//      CREATE TABLE $dbTable(
//       $columnId INTEGER PRIMARY KEY,
//       $columnName TEXT NOT NULL)
//       ''');
//   }

//   //insert method
//   insertRecord(Map<String, dynamic> row) async {
//     Database? dbL = await instance.database;
//     return await dbL?.insert(dbTable, row);
//   }

//   //read-query method
//   Future<List<Map<String, dynamic>>> queryDatabase() async {
//     Database? dbL = await instance.database;
//     return await dbL!.query(dbTable);
//   }

//   //update method
//   Future<int> updateRecord(Map<String, dynamic> row) async {
//     Database? dbL = await instance.database;
//     int id = row[columnId];
//     return await dbL!
//         .update(dbTable, row, where: "$columnId=?", whereArgs: [id]);
//   }

//   //delete method
//   Future<int> deleteRecord(int id) async {
//     Database? dbL = await instance.database;
//     return await dbL!.delete(dbTable, where: "$columnId=?", whereArgs: [id]);
//   }
// }
