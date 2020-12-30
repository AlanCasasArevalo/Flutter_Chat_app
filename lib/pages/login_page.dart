import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static String routeName = 'login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Logo(),
            FormState(),
            LoginRegisterFeedback(),
            SizedBox(height: 8,),
            TermsAndConditions()
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
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

class FormState extends StatefulWidget {
  @override
  _FormStateState createState() => _FormStateState();
}

class _FormStateState extends State<FormState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [TextField(), TextField(), RaisedButton(onPressed: () {})],
      ),
    );
  }
}

class LoginRegisterFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '¿No tienes cuenta?',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 8,),
          Text('Crea una ahora', style: TextStyle(
              color: Colors.blue[600],
              fontSize: 18,
              fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Terminos y condiciones', style: TextStyle(
          color: Colors.black54,
          fontSize: 15,
          fontWeight: FontWeight.w300),),
    );
  }
}


