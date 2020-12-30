
import 'package:flutter/material.dart';
import 'package:flutter_chat/widgets/custom_text_field.dart';

class CustomFormState extends StatefulWidget {
  @override
  _FormStateState createState() => _FormStateState();
}

class _FormStateState extends State<CustomFormState> {

  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomTextField(
            icon: Icons.mail_outline,
            isPassword: false,
            placeholder: 'Email',
            textInputType: TextInputType.emailAddress,
            textEditingController: _emailTextEditingController,
          ),
          CustomTextField(
            icon: Icons.lock,
            isPassword: true,
            placeholder: 'Password',
            textInputType: TextInputType.text,
            textEditingController: _passwordTextEditingController,
          ),
          // TODO: Crear el boton
          RaisedButton(onPressed: () {
            print(_emailTextEditingController.text);
          })
        ],
      ),
    );
  }
}


