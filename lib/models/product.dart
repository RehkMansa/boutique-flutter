import '../res/strings.dart';
import '../utils/utils.dart';

class Product {
  String? name;
  String? description;
  String? productId;
  String? category;
  String? subcategory;
  String? brand;
  int? price;
  int? quantity;
  int? quantityRemaining;
  int? quantitySold;
  int? hasBarcode;
  int? soldOut;
  int? active;
  String? id;
  String? createdAt;
  String? updatedAt;

  Product({
    this.name,
    this.description,
    this.productId,
    this.category,
    this.subcategory,
    this.brand,
    this.price,
    this.quantity,
    this.quantityRemaining,
    this.quantitySold,
    this.hasBarcode,
    this.soldOut,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  Product.fromJson(var json) {
    name = json['name'];
    description = json['description'];
    productId = json['product_id'];
    category = json['category'];
    subcategory = json['subcategory'];
    brand = json['brand'];
    price = json['price'];
    quantity = json['quantity'];
    quantityRemaining = json['quantity_remaining'];
    quantitySold = json['quantity_sold'];
    hasBarcode = json['has_barcode'];
    soldOut = json['sold_out'];
    active = json['active'];
    id = json['id'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }

  Product.fromJsonToReceipt(var json) {
    name = json.name;
    price = json.price;
    quantity = json.quantity;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['product_id'] = productId;
    data['category'] = category;
    data['subcategory'] = subcategory;
    data['brand'] = brand;
    data['price'] = price;
    data['quantity'] = quantity;
    data['quantity_remaining'] = quantityRemaining;
    data['quantity_sold'] = quantitySold;
    data['has_barcode'] = hasBarcode;
    data['sold_out'] = soldOut;
    data['active'] = active;
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static Map<String, dynamic> addProductMap({
    required String name,
    String? description,
    String? productId,
    String? category,
    String? subcategory,
    String? brand,
    required dynamic price,
    required dynamic quantity,
    dynamic quantitySold,
  }) {
    try {
      price = price != null ? int.parse(price) : null;
      quantity = quantity != null ? int.parse(quantity) : null;
    } catch (e) {
      dnd(e);
    }

    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = Utils.generateDbId();
    data['name'] = name;
    data['description'] = description ??= '';
    data['product_id'] = getProductId(productId);
    data['category'] = category ??= '';
    data['subcategory'] = subcategory ??= '';
    data['brand'] = brand ??= '';
    data['price'] = price;
    data['quantity'] = quantity;
    data['quantity_remaining'] = 0;
    data['quantity_sold'] = quantitySold ?? 0;
    data['has_barcode'] = (productId == null ? 0 : 1);
    data['sold_out'] = 0;
    data['active'] = 1;
    return data;
  }

  static Product? getProduct(dynamic dataObject) {
    return dataObject != null ? Product.fromJson(dataObject) : null;
  }

  static List<String> columns = [
    'id',
    'amount',
    'description',
    'product_id',
    'category',
    'subcategory',
    'brand',
    'price',
    'quantity',
    'quantity_remaining',
    'quantity_sold',
    'has_barcode',
    'sold_out',
    'active',
    'created_a',
    'updated_at',
  ];

  static String table() {
    return Str.productTable;
  }

  static String createTableSQL() {
    String sql = 'CREATE TABLE ';
    sql += table();
    sql += ' (_id	INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT, name TEXT, description	TEXT, product_id TEXT, category TEXT, subcategory TEXT, brand TEXT,'
        ' quantity_remaining INTEGER, quantity_sold INTEGER, has_barcode INTEGER, sold_out INTEGER, active INTEGER, created_at TEXT, updated_at TEXT)';
    return sql;
  }

  static String createHistorySQL() {
    String sql = 'CREATE TABLE ';
    sql += Str.productHistoryTable;
    sql += ' (_id	INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT, name TEXT, description	TEXT, product_id TEXT, category TEXT, subcategory TEXT, brand TEXT,'
        ' has_barcode INTEGER, created_at TEXT, updated_at TEXT)';
    return sql;
  }

  static String priceHistorySQL() {
    String sql = 'CREATE TABLE ';
    sql += Str.priceHistoryTable;
    sql += ' (_id	INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT, product TEXT, price INTEGER, created_at TEXT, updated_at TEXT)';
    return sql;
  }

  static String getProductId(String? productId) {
    productId ??= DateTime.now().millisecondsSinceEpoch.toString();
    return productId;
  }

  static String getTimestampString() {
    var dt = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch);
    // DateForma
    // var d12 = DateUtils();//.format(dt);
    return 'd12';
  }
}
