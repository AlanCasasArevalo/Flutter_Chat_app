import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String uid;
  final String message;
  final AnimationController animationController;

  const ChatMessage({ @required this.uid, @required this.message, @required this.animationController}) : super();

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.elasticInOut
        ),
        child: Container(
          child: this.uid == '123'
            ? _myOwnMessage()
            : _notMyOwnMessage()
          ,
        ),
      ),
    );
  }

  Widget _myOwnMessage(){
    return Align(
      alignment: Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.only(bottom: 8, right: 8, left: 50),
          padding: EdgeInsets.all(8),
          child: Text(this.message, style: TextStyle(color: Colors.white),),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xff4D9EF6)
          ),
        )
    );
  }

  Widget _notMyOwnMessage(){
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(bottom: 8, right: 50, left: 8),
          padding: EdgeInsets.all(8),
          child: Text(this.message, style: TextStyle(color: Colors.black87),),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffE4E5E8)
          ),
        )
    );
  }
}
