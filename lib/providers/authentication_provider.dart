import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat/common/environments.dart';
import 'package:flutter_chat/models/login_model_response.dart';
import 'package:flutter_chat/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationProvider with ChangeNotifier {
  UserModel user;
  bool _authenticating = false;
  final _storage = new FlutterSecureStorage();

  bool get authenticating => this._authenticating;

  set authenticating(bool value) {
    this._authenticating = value;
    notifyListeners();
  }

  // Getter de tokens
  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: Environments.tokenKey);
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: Environments.tokenKey);
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
      await this._saveToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }

  Future register(String name, String email, String password) async {
    this.authenticating = true;

    final loginBody = {'name': name, 'email': email, 'password': password};

    final response = await http.post('${Environments.baseURL}login/register',
        body: jsonEncode(loginBody),
        headers: {'Content-Type': 'application/json'});

    this.authenticating = false;
    if (response.statusCode > 199 && response.statusCode < 299) {
      final loginResponse = loginModelResponseFromJson(response.body);
      this.user = loginResponse.user;
      await this._saveToken(loginResponse.token);
      return true;
    } else {
      final responseErrors = jsonDecode(response.body);
      if (responseErrors['errors'] != null) {
        return 'Error revise sus credenciales, email o password';
      }
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await this._storage.read(key: Environments.tokenKey);
    final response = await http.get('${Environments.baseURL}login/refresh_token',
        headers: {
          'Content-Type': 'application/json',
          'x-token': token
        });

    this.authenticating = false;
    if (response.statusCode > 199 && response.statusCode < 299) {
      final loginResponse = loginModelResponseFromJson(response.body);
      this.user = loginResponse.user;
      await this._saveToken(loginResponse.token);
      return true;
    } else {
      this._logout();
      return false;
    }
  }

  Future _saveToken(String token) async {
    return await _storage.write(key: Environments.tokenKey, value: token);
  }

  Future _logout() async {
    await _storage.delete(key: Environments.tokenKey);
  }
}
