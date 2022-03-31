import '../res/strings.dart';

class Admin {
  String? id;
  String? firstName;
  String? surname;
  String? emailAddress;
  String? phoneNumber;
  String? password;
  int? blocked;
  int? active;
  String? createdAt;
  String? updatedAt;

  Admin({this.id, this.firstName, this.surname, this.emailAddress, this.phoneNumber, this.password, this.blocked, this.active, this.createdAt, this.updatedAt});

  Admin.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    surname = json['surname'];
    emailAddress = json['email_address'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    blocked = json['blocked'];
    active = json['active'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['surname'] = surname;
    data['email_address'] = emailAddress;
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    data['blocked'] = blocked ?? 0;
    data['active'] = active ?? 1;
    if (id != null) data['id'] = id;
    if (createdAt != null) data['created_at'] = createdAt;
    if (updatedAt != null) data['updated_at'] = updatedAt;

    return data;
  }

  static Map<String, dynamic> loginMap(String email, String password) {
    final Map<String, dynamic> data = <String, String>{};
    data['email_address'] = email;
    data['password'] = password;
    return data;
  }

  static Admin? getAdmin(dynamic dataObject) {
    return dataObject != null ? Admin.fromJson(dataObject) : null;
  }

  static List<String> columns = [
    'first_name',
    'surname',
    'email_address',
    'phone_number',
    'password',
    'blocked',
    'active',
    'id',
    'created_at',
    'updated_at',
  ];

  static String table() {
    return Str.adminTable;
  }

  static String createTableSQL() {
    String sql = 'CREATE TABLE ';
    sql += table();
    sql += ' (_id	INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT, first_name TEXT, surname	TEXT, email_address TEXT, phone_number TEXT, '
        ' password TEXT blocked INTEGER, active INTEGER, created_at TEXT, updated_at TEXT)';
    return sql;
  }
}
