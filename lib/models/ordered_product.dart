import 'package:boutique/models/product.dart';
import 'package:boutique/utils/utils.dart';
import 'package:intl/intl.dart';

import '../res/strings.dart';

class OrderedProduct {
  String? id;
  String? order;
  dynamic product;
  int? quantity;
  int? amount;
  String? createdAt;
  String? updatedAt;

  OrderedProduct(
      {this.id,
      this.order,
      this.product,
      this.quantity,
      this.amount,
      this.createdAt,
      this.updatedAt});

  OrderedProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    order = json['order'];
    product = json['product'];
    quantity = json['quantity'];
    amount = json['amount'];
    createdAt = DateFormat.yMMMd().format(json['created_at']);
    updatedAt = DateFormat.jm().format(json['updated_at']);
  }
  OrderedProduct.fromJson2(Map<String, dynamic> json) {
    id = json['id'];
    order = json['order'];
    product = (Product.fromJson(json['product'])).toString();
    quantity = json['quantity'];
    amount = json['amount'];
    createdAt = DateFormat.yMMMd().format(json['created_at']);
    updatedAt = DateFormat.jm().format(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order'] = order;
    data['product'] = product;
    data['quantity'] = quantity;
    data['amount'] = amount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static Map<String, dynamic> addOrderedProductMap({
    required String order,
    String? product,
    int? quantity,
    int? amount,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = Utils.generateDbId();
    data['order'] = order;
    data['product'] = product;
    data['quantity'] = quantity;
    data['amount'] = amount;
    return data;
  }

  static OrderedProduct? getOrder(dynamic dataObject) {
    return dataObject != null ? OrderedProduct.fromJson(dataObject) : null;
  }

  static List<String> columns = [
    'id',
    'order',
    'product',
    'quantity',
    'amount',
    'created_at',
    'updated_at',
  ];

  static String table() {
    return Str.orderedProductTable;
  }

  static String createTableSQL() {
    String sql = 'CREATE TABLE ';
    sql += table();
    sql +=
        ' (_id	INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT, order TEXT, product TEXT, amount INTEGER, created_at TEXT, updated_at TEXT)';
    return sql;
  }
}
