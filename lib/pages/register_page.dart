import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/login_page.dart';
import 'package:flutter_chat/widgets/custom_logo.dart';
import 'package:flutter_chat/widgets/custom_raised_button.dart';
import 'package:flutter_chat/widgets/custom_text_field.dart';
import 'package:flutter_chat/widgets/login_register_feedback.dart';
import 'package:flutter_chat/widgets/terms_and_conditions.dart';

class RegisterPage extends StatelessWidget {
  static String routeName = 'register_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomLogo(title: 'Registro',),
                _RegisterCustomFormState(),
                LoginRegisterFeedback(
                  placeholder: '¿Ya tienes cuenta?',
                  routeToNavigate: LoginPage.routeName,
                  titleNavigationRoute: 'Ir a login',
                ),
                SizedBox(height: 8,),
                TermsAndConditions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterCustomFormState extends StatefulWidget {
  @override
  _FormStateState createState() => _FormStateState();
}

class _FormStateState extends State<_RegisterCustomFormState> {
  final TextEditingController _userTextEditingController = TextEditingController();
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
            icon: Icons.account_circle,
            isPassword: false,
            placeholder: 'Usuario',
            textInputType: TextInputType.text,
            textEditingController: _userTextEditingController,
          ),
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
          CustomRaisedButton(
            placeholder: 'Ingresar',
            onPressed: () {
              print('');
            },
          )
        ],
      ),
    );
  }
}
