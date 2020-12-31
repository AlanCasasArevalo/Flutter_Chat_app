import 'package:flutter/material.dart';
import 'package:flutter_chat/models/user.dart';

class UsersPage extends StatefulWidget {
  static String routeName = 'users_page';

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  final users = [
    User( online: false, email: 'alan@test.com', name: 'alan', uid: '1',),
    User( online: true, email: 'bibi@test.com', name: 'bibi', uid: '1',),
    User( online: false, email: 'elsa@test.com', name: 'elsa', uid: '1',),
    User( online: true, email: 'vega@test.com', name: 'vega', uid: '1',),
    User( online: false, email: 'mario@test.com', name: 'mario', uid: '1',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Nombre', style: TextStyle(color: Colors.black54),),
        elevation: 2,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black54,),
          onPressed: (){},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.green[400],),
          )
        ],
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, index ) {
            return _userTile(users[index]);
          },
          separatorBuilder: (BuildContext context, index ) => Divider(),
          itemCount: users.length
      ),
    );
  }

  ListTile _userTile(User user) {
    return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: Text(user.name.substring(0,2).toUpperCase()),
            ),
            trailing: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: user.online ? Colors.green[400] : Colors.redAccent,
                borderRadius: BorderRadius.circular(100)
              ),
            ),
          );
  }
}
