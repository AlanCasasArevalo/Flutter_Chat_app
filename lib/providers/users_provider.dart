import 'package:flutter/material.dart';
import 'package:flutter_chat/common/environments.dart';
import 'package:flutter_chat/models/user_model.dart';
import 'package:flutter_chat/models/users_model.dart';
import 'package:flutter_chat/providers/authentication_provider.dart';
import 'package:http/http.dart' as http;

class UsersProvider {

  Future<List<UserModel>> getUsers () async {
    try {
      final token = await AuthenticationProvider.getToken();
      final response = await http.get('${Environments.baseURL}/users',
          headers: {
        'Content-Type': 'application/json',
            'x-token': token
          }
      );

      final usersResponse = usersResponseFromJson(response.body);
      return usersResponse.users;
    } catch (error) {
      print(error);
      return [];
    }
  }
}