import 'package:sqflite/sqflite.dart';

import 'model/product_model.dart';

class DatabaseHelper {
  late final Database _database;

  DatabaseHelper._privateConstructor() {
    initializeDatabase();
  }

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<void> initializeDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = databasesPath + 'products.db';

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE products (
            id INTEGER PRIMARY KEY,
            productName TEXT,
            productPrice TEXT,
            productDescription TEXT,
            productImage TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertProduct(ProductModel product) async {
    await _database.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ProductModel>> getProducts() async {
    final List<Map<String, dynamic>> maps = await _database.query('products');
    return List.generate(maps.length, (index) {
      return ProductModel.fromMap(maps[index]);
    });
  }

  Future<void> deleteAllProducts() async {
    await _database.delete('products');
  }
}