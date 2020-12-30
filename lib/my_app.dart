import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
