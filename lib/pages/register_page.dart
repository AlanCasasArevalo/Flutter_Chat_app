import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/login_page.dart';
import 'package:flutter_chat/widgets/custom_form_state.dart';
import 'package:flutter_chat/widgets/custom_logo.dart';
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
                CustomFormState(),
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
