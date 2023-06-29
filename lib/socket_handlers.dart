import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketHandler {
  static late IO.Socket socket;
  static String authToken = 'YOUR_AUTH_TOKEN';
  static Future<void> updateVetStatus() async {
    socket = IO.io(
      "http://localhost:8080",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setExtraHeaders({'token': authToken})
          .build(),
    );
    socket.emit("update_activity");
    socket.connect();
    setupSocketListener();
  }

  static Future<void> setupSocketListener() async {
    socket.on('update_activity', (data) {
      print("Update activity emitted : " + data);
      // setState(() {
      //   isOnline = true;
      // });
    });
  }
}
