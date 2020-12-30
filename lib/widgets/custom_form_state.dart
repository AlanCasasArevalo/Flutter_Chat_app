
import 'package:flutter/material.dart';
import 'package:flutter_chat/widgets/custom_text_field.dart';

class CustomFormState extends StatefulWidget {
  @override
  _FormStateState createState() => _FormStateState();
}

class _FormStateState extends State<CustomFormState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomTextField(),

          // TODO: Crear el boton
          // RaisedButton(onPressed: () {})
        ],
      ),
    );
  }
}


