import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/chat_page.dart';
import 'package:flutter_chat/pages/loading_pager.dart';
import 'package:flutter_chat/pages/login_page.dart';
import 'package:flutter_chat/pages/register_page.dart';
import 'package:flutter_chat/pages/users_page.dart';

Map<String, WidgetBuilder> getApplications() {
  return routes;
}

final routes = <String, WidgetBuilder>{
  UsersPage.routeName: (BuildContext context) => UsersPage(),
  LoadingPage.routeName: (BuildContext context) => LoadingPage(),
  ChatPage.routeName: (BuildContext context) => ChatPage(),
  LoginPage.routeName: (BuildContext context) => LoginPage(),
  RegisterPage.routeName: (BuildContext context) => RegisterPage(),
};

MaterialPageRoute<dynamic> Function(RouteSettings) getDefaultRouteApplications() {
  return defaultRoute;
}

final defaultRoute = (RouteSettings settings) =>
    MaterialPageRoute(builder: (BuildContext context) => LoadingPage()
);
