import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat/common/environments.dart';
import 'package:http/http.dart' as http;

class AuthenticationProvider with ChangeNotifier {
  Future login(String email, String password) async {
    final loginBody = {'email': email, 'password': password};

    final response = await http.post('${Environments.baseURL}login',
        body: jsonEncode(loginBody), headers: {
          'Content-Type': 'application/json'
        });

    print(response);
  }
}
