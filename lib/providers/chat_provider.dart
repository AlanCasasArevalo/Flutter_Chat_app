import 'package:flutter/material.dart';
import 'package:flutter_chat/models/user_model.dart';

class ChatProvider with ChangeNotifier {
  UserModel userToSendMessage;
}