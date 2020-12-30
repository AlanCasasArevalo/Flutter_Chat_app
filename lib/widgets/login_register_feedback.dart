
import 'package:flutter/material.dart';

class LoginRegisterFeedback extends StatelessWidget {

  final String routeToNavigate;
  final String placeholder;
  final String titleNavigationRoute;

  const LoginRegisterFeedback({ @required this.routeToNavigate, @required this.placeholder, @required this.titleNavigationRoute}) : super();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.placeholder,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 8,),
          GestureDetector(
            child: Text(this.titleNavigationRoute, style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacementNamed(context, routeToNavigate);
            },
          )
        ],
      ),
    );
  }
}
