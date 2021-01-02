import 'package:flutter/material.dart';
import 'package:flutter_chat/common/constants.dart';
import 'package:flutter_chat/common/show_alert.dart';
import 'package:flutter_chat/pages/register_page.dart';
import 'package:flutter_chat/pages/users_page.dart';
import 'package:flutter_chat/providers/authentication_provider.dart';
import 'package:flutter_chat/providers/socket_provider.dart';
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
                  title: Constants.loginPageTitle,
                ),
                _LoginCustomFormState(),
                LoginRegisterFeedback(
                  placeholder: Constants.loginPagePlaceholder,
                  routeToNavigate: RegisterPage.routeName,
                  titleNavigationRoute: Constants.loginPageNavigationRoute,
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
    final _socketProvider = Provider.of<SocketProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomTextField(
            icon: Icons.mail_outline,
            isPassword: false,
            placeholder: Constants.emailPlaceholder,
            textInputType: TextInputType.emailAddress,
            textEditingController: _emailTextEditingController,
          ),
          CustomTextField(
            icon: Icons.lock,
            isPassword: true,
            placeholder: Constants.passwordPlaceholder,
            textInputType: TextInputType.text,
            textEditingController: _passwordTextEditingController,
          ),
          CustomRaisedButton(
            placeholder: Constants.loginButtonTitle,
            onPressed: _authProvider.authenticating
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final successLogin = await _authProvider.login(_emailTextEditingController.text.trim(),
                        _passwordTextEditingController.text.trim());

                    if (successLogin) {
                      _socketProvider.connect();
                      Navigator.pushReplacementNamed(context, UsersPage.routeName);
                    } else {
                      showAlert(context, Constants.loginErrorTitle, Constants.loginErrorBody);
                    }
                  },
          )
        ],
      ),
    );
  }
}
