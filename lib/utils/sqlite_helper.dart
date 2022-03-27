import 'package:boutique/models/admin.dart';
import 'package:boutique/models/brand.dart';
import 'package:boutique/models/order.dart';
import 'package:boutique/models/ordered_product.dart';
import 'package:boutique/models/product.dart';
import 'package:boutique/models/subcategory.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/category.dart';

class SQLiteHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    var documentDirectory = await getDatabasesPath();
    String path = join(documentDirectory, 'boutique.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(Admin.createTableSQL());
    await db.execute(Category.createTableSQL());
    await db.execute(Subcategory.createTableSQL());
    await db.execute(Brand.createTableSQL());
    await db.execute(Product.createTableSQL());
    await db.execute(Product.createHistorySQL());
    await db.execute(Product.priceHistorySQL());
    await db.execute(Order.createTableSQL());
    await db.execute(OrderedProduct.createTableSQL());

  }

  Future<int> insert(String table, data) async {
    var dbClient = await db;
    int id = await dbClient!.insert(table, data);
    return id;
  }

  Future<List<dynamic>> fetch(object) async {
    var dbClient = await db;
    List<Map> maps = await dbClient!.query(object.table(), columns: object.columns);
    List<dynamic> list = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        list.add(object.fromJson(maps[i]));
      }
    }
    return list;
  }

  Future<List<dynamic>> fetchAll(String table, columns) async {
    var dbClient = await db;
    List<Map> maps = await dbClient!.query(table, columns: columns);
    return maps;
  }

  Future<List<dynamic>> fetchRandom(String table, columns, int limit) async {
    var dbClient = await db;
    List<Map> maps = await dbClient!.query(table, columns: columns, orderBy: 'RANDOM()', limit: limit);
    return maps;
  }

  Future<int> delete(String table, [int? id]) async {
    var dbClient = await db;
    if (id == null) {
      return await dbClient!.delete(table, where: '1');
    } else {
      return await dbClient!.delete(
        table,
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  Future<int> update(object, id) async {
    var dbClient = await db;
    return await dbClient!.update(
      object.table(),
      object.toJson(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient!.close();
  }
}
