import 'package:flutter/material.dart';
import 'package:flutter_chat/routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: getDefaultRouteApplications(),
        routes: getApplications(),
    );
  }
}
