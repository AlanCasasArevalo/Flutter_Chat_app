
import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        margin: EdgeInsets.only(top: 42),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/tag_logo.png'),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Chat',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
