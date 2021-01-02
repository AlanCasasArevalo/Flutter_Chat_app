import 'package:flutter/material.dart';
import 'package:flutter_chat/common/show_alert.dart';
import 'package:flutter_chat/pages/register_page.dart';
import 'package:flutter_chat/providers/authentication_provider.dart';
import 'package:flutter_chat/widgets/custom_logo.dart';
import 'package:flutter_chat/widgets/custom_raised_button.dart';
import 'package:flutter_chat/widgets/custom_text_field.dart';
import 'package:flutter_chat/widgets/login_register_feedback.dart';
import 'package:flutter_chat/widgets/terms_and_conditions.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static String routeName = 'login_page';

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
                CustomLogo(
                  title: 'Login',
                ),
                _LoginCustomFormState(),
                LoginRegisterFeedback(
                  placeholder: '¿No tienes cuenta?',
                  routeToNavigate: RegisterPage.routeName,
                  titleNavigationRoute: 'Crea una ahora!!',
                ),
                SizedBox(
                  height: 8,
                ),
                TermsAndConditions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginCustomFormState extends StatefulWidget {
  @override
  _FormStateState createState() => _FormStateState();
}

class _FormStateState extends State<_LoginCustomFormState> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthenticationProvider>(context);

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
          CustomRaisedButton(
            placeholder: 'Ingresar',
            onPressed: _authProvider.authenticating
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final successLogin = await _authProvider.login(_emailTextEditingController.text.trim(),
                        _passwordTextEditingController.text.trim());

                    if (successLogin) {

                      // TODO: Navegar a la siguiente pantalla
                    } else {
                      // ERROR
                      // TODO: Alerta de error
                      showAlert(context, 'Login erroneo', 'Revise los campos');
                    }
                  },
          )
        ],
      ),
    );
  }
}
