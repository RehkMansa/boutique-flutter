class Admin {
  String? id;
  String? firstName;
  String? surname;
  String? emailAddress;
  String? phoneNumber;
  String? password;
  int? blocked;
  int? active;

  Admin(
      {this.id,
      this.firstName,
      this.surname,
      this.emailAddress,
      this.phoneNumber,
      this.password,
      this.blocked,
      this.active});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    surname = json['surname'];
    emailAddress = json['email_address'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    blocked = json['blocked'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['surname'] = surname;
    data['email_address'] = emailAddress;
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    data['blocked'] = blocked;
    data['active'] = active;
    return data;
  }

  static Map<String, dynamic> loginMap(String email, String password) {
    final Map<String, dynamic> data = <String, String>{};
    data['email_address'] = email;
    data['password'] = password;
    return data;
  }
}
