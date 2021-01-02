// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_chat/models/user_model.dart';

UsersModelResponse usersResponseFromJson(String str) => UsersModelResponse.fromJson(json.decode(str));

String usersResponseToJson(UsersModelResponse data) => json.encode(data.toJson());

class UsersModelResponse {
  UsersModelResponse({
    this.result,
    this.users,
  });

  bool result;
  List<UserModel> users;

  factory UsersModelResponse.fromJson(Map<String, dynamic> json) => UsersModelResponse(
    result: json["result"],
    users: List<UserModel>.from(json["users"].map((x) => UserModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}
