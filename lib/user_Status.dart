import 'package:flutter/material.dart';
import 'package:user_status_app/socket_handlers.dart';

class UserStatusWidget extends StatefulWidget {
  @override
  _UserStatusWidgetState createState() => _UserStatusWidgetState();
}

// const String authToken =
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0OWQ0MWE2Y2Q3ZmRmYjVmZmVlZDRkMSIsInVzZXJUeXBlIjoiZG9jdG9yIiwiaWF0IjoxNjg4MDI3NTU5LCJleHAiOjE2ODg4OTE1NTl9.g7eaSWVQsdvDOjwlGWbim_31Y4KKCxz03tVzuhYI7qU';

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
