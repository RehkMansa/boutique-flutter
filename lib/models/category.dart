import 'package:boutique/utils/utils.dart';

import '../res/strings.dart';

class Category {
  String? category;
  String? id;
  String? createdAt;
  String? updatedAt;

  Category({this.category});

  Category.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    id = json['id'];
    createdAt = 'Edit'; //json['created_at'];
    updatedAt = ''; //json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static Category? getCategory(dynamic dataObject) {
    return dataObject != null ? Category.fromJson(dataObject) : null;
  }

  static Map<String, dynamic> addMap(String category) {
    final Map<String, dynamic> data = <String, String>{};
    data['id'] = Utils.generateDbId();
    data['category'] = category;
    return data;
  }

  static List<String> columns = [
    'id',
    'category',
  ];

  static String table() {
    return Str.categoryTable;
  }

  static String createTableSQL() {
    String sql = 'CREATE TABLE ';
    sql += table();
    sql += '(_id	INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT, category TEXT)';
    return sql;
  }
}
