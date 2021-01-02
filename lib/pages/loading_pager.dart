import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/login_page.dart';
import 'package:flutter_chat/pages/users_page.dart';
import 'package:flutter_chat/providers/authentication_provider.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  static String routeName = 'loading_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
            child: Text('Esperando .....'),
          );
        },
      ),
    );
  }

  Future _checkLoginState(BuildContext context) async {
    final _authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
    final authenticated = await _authProvider.isLoggedIn();
    if (authenticated) {
      // TODO: Conectar al socket
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => UsersPage(),
            transitionDuration: Duration(milliseconds: 2)
          )
      );
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }
}
