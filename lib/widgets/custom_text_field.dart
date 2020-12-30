
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final IconData icon;
  final String placeholder;
  final TextEditingController textEditingController;
  final bool isPassword;
  final TextInputType textInputType;

  const CustomTextField({
    this.icon,
    this.placeholder,
    this.textEditingController,
    this.isPassword = false,
    this.textInputType = TextInputType.text
  }) : super();

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              offset: Offset(0,5),
              blurRadius: 5
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: textEditingController,
        autocorrect: false,
        keyboardType: textInputType,
        obscureText: isPassword,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: placeholder
        ),
      ),
    );
  }
}