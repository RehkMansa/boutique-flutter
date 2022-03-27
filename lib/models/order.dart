import '../res/strings.dart';

class Order {
  String? id;
  int? amount;
  int? paid;
  String? paymentMethod;
  String? createdAt;
  String? updatedAt;

  Order({this.id, this.amount, this.paid, this.paymentMethod, this.createdAt, this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    paid = json['paid'];
    paymentMethod = json['payment_method'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['paid'] = paid;
    data['payment_method'] = paymentMethod;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static Order? getOrder(dynamic dataObject) {
    return dataObject != null ? Order.fromJson(dataObject) : null;
  }

  static List<String> columns = [
    'id',
    'amount',
    'paid',
    'payment_method',
    'created_at',
    'updated_at',
  ];

  static String table() {
    return Str.orderTable;
  }

  static String createTableSQL() {
    String sql = 'CREATE TABLE ';
    sql += table();
    sql += ' (_id	INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT, amount INTEGER, payment_method	TEXT, paid INTEGER, created_at TEXT, updated_at TEXT)';
    return sql;
  }
}
