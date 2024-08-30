import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  static DbHelper dbHelper = DbHelper._();
  DbHelper._();

  Database? _db;
  Future get database async => _db ?? await initDatabase();


  Future initDatabase() async {

    final path = await getDatabasesPath();
    final dbPath = join(path, 'quotes.db');

    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''CREATE TABLE quotes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        quote TEXT,
        author TEXT,
        image TEXT,
        category TEXT);
        ''';
        await db.execute(sql);
      },
    );
    return _db;
  }

  Future insertData(String quote,String author,String category,String image)
  async {
    Database? db = await database;
    String sql = '''INSERT INTO quotes (quote,author,category,image)
    VALUES (?,?,?,?);
    ''';
    List args = [quote,author,category,image];
    await db!.rawInsert(sql,args);
  }

  Future<List<Map>> readData()
  async {
    Database? db = await database;
    String sql = '''SELECT * FROM quotes''';
    return await db!.rawQuery(sql);
  }

  Future<List<Map<String, Object?>>> readCategoryData(String category)
  async {
    Database? db = await database;
    String sql ='''
    SELECT * FROM quotes WHERE category = ?
    ''';
    List args = [category];
    return await db!.rawQuery(sql,args);
  }

  Future deleteData(int id)
  async {
    Database? db = await database;
    String sql = '''DELETE FROM quotes WHERE id = ?''';
    List args = [id];
    await db!.rawDelete(sql,args);
  }

}