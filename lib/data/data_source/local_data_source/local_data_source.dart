import 'package:flutter_test_assignment/data/models/house_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataSource {
  static final LocalDataSource _instance = LocalDataSource.internal();
  static Database? _database;

  factory LocalDataSource() {
    return _instance;
  }

  LocalDataSource.internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), "house.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: ((db, version) {
        return db.execute(
          'CREATE TABLE houses(id INTEGER PRIMARY KEY, name TEXT, floorsCount INTEGER)',
        );
      }),
    );
  }

  Future<void> insertHouse(HouseModel houseModel) async {
    final db = await database;
    await db.insert(
      "houses",
      houseModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<HouseModel>> houses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('houses');
    return List.generate(maps.length, (i) {
      return HouseModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        floorsCount: maps[i]['floorsCount'],
      );
    });
  }
}
