import '../res/strings.dart';

class Brand {
  String? brand;
  String? id;
  String? createdAt;
  String? updatedAt;

  Brand({this.brand});

  Brand.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand'] = brand;
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static Brand? getCategory(dynamic dataObject) {
    return dataObject != null ? Brand.fromJson(dataObject) : null;
  }

  static List<String> columns = [
    'id',
    'brand',
  ];

  static String table() {
    return Str.brandTable;
  }

  static String createTableSQL() {
    String sql = 'CREATE TABLE ';
    sql += table();
    sql += '(_id	INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT, brand TEXT)';
    return sql;
  }
}
