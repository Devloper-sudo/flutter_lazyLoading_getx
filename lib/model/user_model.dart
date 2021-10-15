import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModeltoJson(List<UserModel> str) =>
    json.encode(List<dynamic>.from(str.map((x) => x.toJson())));

class UserModel {
  String? id;
  String? name;
  String? userName;

  UserModel({this.id, this.name, this.userName});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['userName'] = userName;

    return data;
  }
}
