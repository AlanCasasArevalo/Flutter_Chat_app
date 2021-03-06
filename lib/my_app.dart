import 'package:flutter/material.dart';
import 'package:flutter_chat/providers/chat_provider.dart';
import 'package:flutter_chat/providers/socket_provider.dart';
import 'package:flutter_chat/routes/routes.dart';
import 'package:provider/provider.dart';

import 'providers/authentication_provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => SocketProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => ChatProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: getDefaultRouteApplications(),
          routes: getApplications(),
      ),
    );
  }
}
