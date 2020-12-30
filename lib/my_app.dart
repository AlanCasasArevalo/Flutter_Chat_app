import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/loading_pager.dart';
import 'package:flutter_chat/routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: getDefaultRouteApplications(),
        initialRoute: LoadingPage.routeName,
        routes: getApplications(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Chat'),
          ),
          body: Center(
            child: Container(
              child: Text('PON_AQUI_CUALQUIER_COSA'),
            ),
          ),
        )
    );
  }
}
