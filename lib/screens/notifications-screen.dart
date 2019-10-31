import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NotificationScreenState();
  }
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.grey[50],
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800], //change your color here
        ),
      ),
    );
  }
}
