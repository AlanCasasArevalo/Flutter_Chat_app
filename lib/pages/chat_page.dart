import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  static String routeName = 'chat_page';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();

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
                    itemBuilder: (context, index) {
                      return Text('$index hola');
                    },
                    reverse: true,
                  )),
              Divider(
                height: 2,
              ),
              // TODO: Hacer la caja de texto bien
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
                      // TODO: Cuando hay un valor a postear
                    },
                    decoration: InputDecoration.collapsed(
                        hintText: 'Enviar mensaje'),
                    focusNode: _focusNode,
                  )
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: !Platform.isIOS
                    ? CupertinoButton(
                    child: Text('Enviar'), onPressed: () {}
                )
                    : Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.blue[300],),
                    onPressed: (){},
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

  _handleSubmit (String value) {
    print(value);
    _focusNode.requestFocus();
    _textEditingController.clear();
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
