import 'package:flutter/material.dart';
import 'package:flutter_chat/models/user_model.dart';
import 'package:flutter_chat/pages/chat_page.dart';
import 'package:flutter_chat/pages/login_page.dart';
import 'package:flutter_chat/providers/authentication_provider.dart';
import 'package:flutter_chat/providers/chat_provider.dart';
import 'package:flutter_chat/providers/socket_provider.dart';
import 'package:flutter_chat/providers/users_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  static String routeName = 'users_page';

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final _usersProvider = new UsersProvider();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<UserModel> users = [];

  @override
  void initState() {
    this._onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthenticationProvider>(context);
    final _socketProvider = Provider.of<SocketProvider>(context);

    UserModel userLoggedIn = _authProvider.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userLoggedIn.name,
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
            AuthenticationProvider.deleteToken();
            _socketProvider.disconnect();
          },
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              child: _getIcon(_socketProvider.serverStatus))
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        onRefresh: _onRefresh,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400]),
          waterDropColor: Colors.blue[400],
        ),
        controller: _refreshController,
        child: _userBuildListView(),
      ),
    );
  }

  ListView _userBuildListView() {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          return _userTile(users[index]);
        },
        separatorBuilder: (BuildContext context, index) => Divider(),
        itemCount: users.length);
  }

  Icon _getIcon(ServerStatus status) {
    if (status == ServerStatus.Online) {
      return Icon(
        Icons.check_circle,
        color: Colors.green[400],
      );
    } else if (status == ServerStatus.Offline) {
      return Icon(
        Icons.offline_bolt,
        color: Colors.red,
      );
    } else {
      return Icon(
        Icons.refresh,
        color: Colors.grey,
      );
    }
  }

  ListTile _userTile(UserModel user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(user.name.substring(0, 2).toUpperCase()),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: user.online ? Colors.green[400] : Colors.redAccent,
            borderRadius: BorderRadius.circular(100)),
      ),
      onTap: () {
        final _chatService = Provider.of<ChatProvider>(context, listen: false);
        _chatService.userToSendMessage = user;
        Navigator.pushNamed(context, ChatPage.routeName);
      },
    );
  }

  _onRefresh() async {
    this.users = await _usersProvider.getUsers();
    setState(() {});
    _refreshController.refreshCompleted();
  }
}
