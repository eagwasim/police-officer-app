import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:police_officer_app/main.dart';
import 'package:police_officer_app/models/user-model.dart';
import 'package:police_officer_app/utils/route.dart';
import 'package:police_officer_app/utils/shared-preference-util.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

class _SettingState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey[800], //change your color here
        ),
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/images/officer_app_logo_with_white.png",
                                height: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "POLICE NG",
                                  style: TextStyle(fontSize: 40, letterSpacing: .1, fontWeight: FontWeight.bold, color: Colors.green),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "The Nigerian Police Force",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Copyright 2019",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Version 1.0.0",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () async {
                      User user = await SharedPreferenceUtil.currentUser();
                      await firebaseMessaging.unsubscribeFromTopic("${user.id}");
                      await SharedPreferenceUtil.logout();
                      await bg.BackgroundGeolocation.stop();

                      Navigator.pushNamedAndRemoveUntil(context, Routes.LOGIN_SCREEN, (route) {
                        return true;
                      });
                    },
                    child: Text(
                      "LOG OUT",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
