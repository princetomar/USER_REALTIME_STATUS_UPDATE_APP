import 'package:flutter/material.dart';
import 'package:user_status_app/socket_handlers.dart';

class UserStatusWidget extends StatefulWidget {
  @override
  _UserStatusWidgetState createState() => _UserStatusWidgetState();
}

class _UserStatusWidgetState extends State<UserStatusWidget> {
  bool isOnline = false;
  // late IO.Socket socket;

  @override
  void initState() {
    SocketHandler.updateVetStatus().then((value) {
      setState(() {
        isOnline = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        isOnline ? 'Online' : 'Offline',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isOnline ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
