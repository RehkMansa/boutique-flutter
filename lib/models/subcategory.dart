import '../res/strings.dart';

class Subcategory {
  String? category;
  String? subcategory;
  String? id;
  String? createdAt;
  String? updatedAt;

  Subcategory({this.category});

  Subcategory.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    subcategory = json['subcategory'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['subcategory'] = subcategory;
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static Subcategory? getSubcategory(dynamic dataObject) {
    return dataObject != null ? Subcategory.fromJson(dataObject) : null;
  }

  static List<String> columns = [
    'id',
    'category',
    'subcategory',
  ];

  static String table() {
    return Str.subcategoryTable;
  }

  static String createTableSQL() {
    String sql = 'CREATE TABLE ';
    sql += table();
    sql += '(_id	INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT, category TEXT, subcategory TEXT)';
    return sql;
  }
}
