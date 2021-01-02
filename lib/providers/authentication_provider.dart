import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat/common/environments.dart';
import 'package:flutter_chat/models/login_model_response.dart';
import 'package:flutter_chat/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthenticationProvider with ChangeNotifier {
  UserModel user;
  bool _authenticating = false;

  bool get authenticating => this._authenticating;

  set authenticating(bool value) {
    this._authenticating = value;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    this.authenticating = true;

    final loginBody = {'email': email, 'password': password};

    final response = await http.post('${Environments.baseURL}login',
        body: jsonEncode(loginBody),
        headers: {'Content-Type': 'application/json'});

    this.authenticating = false;
    if (response.statusCode > 199 && response.statusCode < 299) {
      final loginResponse = loginModelResponseFromJson(response.body);
      this.user = loginResponse.user;
      // TODO: Guardar token en algun lado
      return true;
    } else {
      return false;
    }
  }
}
