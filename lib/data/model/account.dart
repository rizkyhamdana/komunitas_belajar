import 'dart:convert';

Account accountFromJson(Map<String, dynamic> str) => Account.fromJson(str);

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
  String? password;
  String? username;

  Account({this.password, this.username});

  Account.fromJson(Map<String, dynamic> json) {
    password = json["password"];
    username = json["username"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["password"] = password;
    data["username"] = username;
    return data;
  }
}
