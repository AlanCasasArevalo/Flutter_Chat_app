import 'package:flutter/material.dart';
import 'package:flutter_chat/common/environments.dart';
import 'package:flutter_chat/models/user_model.dart';
import 'package:flutter_chat/models/history_chat_response.dart';
import 'package:flutter_chat/providers/authentication_provider.dart';

import 'package:http/http.dart' as http;

class ChatProvider with ChangeNotifier {
  UserModel userToSendMessage;

  Future<List<Message>> getHistoryChat (String userId) async {
    final response = await http.get('${Environments.baseURL}messages/$userId',
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthenticationProvider.getToken()
        });

    if (response.statusCode > 199 && response.statusCode < 299) {
      final messagesResponse = historyChatResponseFromJson(response.body);
      return messagesResponse.messages;
    } else {
      return [];
    }
  }
}