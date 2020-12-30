import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {

  final String placeholder;
  final Function onPressed;

  const CustomRaisedButton({ @required this.placeholder,  @required this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        elevation: 3,
        highlightElevation: 5,
        color: Colors.blue,
        shape: StadiumBorder(),
        child: Container(
          height: 48,
          width: double.infinity,
          child: Center(
            child: Text(
              placeholder,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        onPressed: onPressed);
  }
}
