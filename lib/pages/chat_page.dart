import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/common/constants.dart';
import 'package:flutter_chat/models/user_model.dart';
import 'package:flutter_chat/providers/authentication_provider.dart';
import 'package:flutter_chat/providers/chat_provider.dart';
import 'package:flutter_chat/providers/socket_provider.dart';
import 'package:flutter_chat/widgets/chat_message.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  static String routeName = 'chat_page';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool _isEditing = false;
  ChatProvider _chatService;
  SocketProvider _socketProvider;
  AuthenticationProvider _authenticationProvider;

  List<ChatMessage> _messages = [];

  @override
  void initState() {
    this._chatService = Provider.of<ChatProvider>(context, listen: false);
    this._socketProvider = Provider.of<SocketProvider>(context, listen: false);
    this._authenticationProvider = Provider.of<AuthenticationProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    UserModel _userToSendMessage = _chatService.userToSendMessage;

    return Scaffold(
        appBar: _buildAppBar(_userToSendMessage),
        body: Container(
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (context, index) => _messages[index],
                reverse: true,
              )),
              Divider(
                height: 2,
              ),
              Container(
                child: _inputChat(),
              )
            ],
          ),
        ));
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textEditingController,
            onSubmitted: _handleSubmit,
            onChanged: (String value) {
              // _isEditing
              setState(() {
                value.trim().length > 1
                    ? _isEditing = true
                    : _isEditing = false;
              });
            },
            decoration: InputDecoration.collapsed(hintText: Constants.chatPageSendPlaceholder),
            focusNode: _focusNode,
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Platform.isIOS
                ? CupertinoButton(
                    child: Text(Constants.chatPageSendButton),
                    onPressed: _isEditing
                        ? () => _handleSubmit(_textEditingController.text)
                        : null,
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[300]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(Icons.send),
                        onPressed: _isEditing
                            ? () => _handleSubmit(_textEditingController.text)
                            : null,
                      ),
                    ),
                  ),
          )
        ],
      ),
    ));
  }

  _handleSubmit(String message) {
    if (message.trim().isEmpty) {
      return;
    }

    _focusNode.requestFocus();
    _textEditingController.clear();

    final newMessage = ChatMessage(
      uid: '123',
      message: message,
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 400)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _isEditing = false;
    });

    this._socketProvider.emit('personal_message', {
      'from': this._authenticationProvider.currentUser.uid,
      'to': this._chatService.userToSendMessage.uid,
      'message': message
    });
  }

  AppBar _buildAppBar(UserModel userToSendMessage) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Column(
        children: [
          CircleAvatar(
            child: Text(
              userToSendMessage.name.substring(0,2),
              style: TextStyle(fontSize: 12),
            ),
            backgroundColor: Colors.blue[100],
            maxRadius: 15,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            userToSendMessage.name,
            style: TextStyle(color: Colors.black87, fontSize: 14),
          )
        ],
      ),
      centerTitle: true,
      elevation: 2,
    );
  }

  @override
  void dispose() {

    _messages.forEach((chatMessage) {
      chatMessage.animationController.dispose();
    });

    // TODO: off del socket
    super.dispose();
  }
}
