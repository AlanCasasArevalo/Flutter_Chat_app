import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  static String routeName = 'chat_page';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool _isEditing = false;

  List<ChatMessage> _messages = [
    ChatMessage(uid: '123', message: 'Hola',),
    ChatMessage(uid: '125', message: 'Hola',),
    ChatMessage(uid: '133', message: 'Hola',),
    ChatMessage(uid: '123', message: 'Hola',),
    ChatMessage(uid: '23', message: 'Hola',),
    ChatMessage(uid: '123', message: 'Hola',),
    ChatMessage(uid: '23', message: 'Hola',),
    ChatMessage(uid: '123', message: 'Hola',),
    ChatMessage(uid: '23', message: 'Hola',),
    ChatMessage(uid: '123', message: 'Hola',),
    ChatMessage(uid: '23', message: 'Hola',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
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
            decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
            focusNode: _focusNode,
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Platform.isIOS
                ? CupertinoButton(
                    child: Text('Enviar'),
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

  _handleSubmit(String value) {
    _focusNode.requestFocus();
    _textEditingController.clear();

    final newMessage = ChatMessage(uid: '123', message: value,);
    _messages.insert(0, newMessage);

    setState(() {
      _isEditing = false;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Column(
        children: [
          CircleAvatar(
            child: Text(
              'TE',
              style: TextStyle(fontSize: 12),
            ),
            backgroundColor: Colors.blue[100],
            maxRadius: 15,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            'Teresa Eneldo',
            style: TextStyle(color: Colors.black87, fontSize: 14),
          )
        ],
      ),
      centerTitle: true,
      elevation: 2,
    );
  }
}
