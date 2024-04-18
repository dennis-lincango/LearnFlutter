import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, password TEXT, email TEXT)",
        );
      },
      version: 1,
    );
  }

}

// class DatabaseHelper {
//   static final _databaseName = "my_database.db";
//   static final _databaseVersion = 1;
//
//   static final table = 'users';
//   static final columnName = 'name';
//   static final columnPassword = 'password';
//   static final columnEmail = 'email';
//
//
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), _databaseName);
//     return await openDatabase(path, version: _databaseVersion,
//         onCreate: _onCreate);
//   }
//
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE $table (
//         $columnName TEXT PRIMARY KEY,
//         $columnPassword TEXT NOT NULL,
//         $columnEmail TEXT NOT NULL
//       )
//       ''');
//   }
//
//   Future<int> insertUser(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert(table, row);
//   }
// }


