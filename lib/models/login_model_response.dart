import 'dart:convert';

import 'package:flutter_chat/models/user_model.dart';

LoginModelResponse loginModelResponseFromJson(String str) => LoginModelResponse.fromJson(json.decode(str));

String loginModelResponseToJson(LoginModelResponse data) => json.encode(data.toJson());

class LoginModelResponse {
  LoginModelResponse({
    this.result,
    this.user,
    this.token,
  });

  bool result;
  UserModel user;
  String token;

  factory LoginModelResponse.fromJson(Map<String, dynamic> json) => LoginModelResponse(
    result: json["result"],
    user: UserModel.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "user": user.toJson(),
    "token": token,
  };
}
