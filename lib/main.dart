import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:police_officer_app/http/base-resource.dart';
import 'package:police_officer_app/http/officer-resource.dart';
import 'package:police_officer_app/screens/feedback-screen.dart';
import 'package:police_officer_app/screens/home-screen.dart';
import 'package:police_officer_app/screens/login-screen.dart';
import 'package:police_officer_app/screens/missing-persons-screen.dart';
import 'package:police_officer_app/screens/notifications-screen.dart';
import 'package:police_officer_app/screens/phone-code-verification-screen.dart';
import 'package:police_officer_app/screens/privacy-screen.dart';
import 'package:police_officer_app/screens/profile-update-screen.dart';
import 'package:police_officer_app/screens/public-notice-screen.dart';
import 'package:police_officer_app/screens/settings-screen.dart';
import 'package:police_officer_app/screens/splash-screen.dart';
import 'package:police_officer_app/screens/wanted-list-screen.dart';
import 'package:police_officer_app/utils/route.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

void main() => runApp(MyApp());

final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> implements BaseResponseListener {
  @override
  void onResponse(BaseResponse response) {
    print(response);
  }

  @override
  void initState() {
    super.initState();

    _setUpLocationTracking();
    ////
    // 1.  Listen to events (See docs for all 12 available events).
    //
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.SPLASH_SCREEN,
      routes: {
        Routes.SPLASH_SCREEN: (context) => SplashScreen(),
        Routes.LOGIN_SCREEN: (context) => LoginScreen(),
        Routes.PHONE_NUMBER_VERIFICATION_SCREEN: (context) => PhoneCodeVerificationScreen(),
        Routes.PROFILE_SCREEN: (context) => ProfileUpdateScreen(),
        Routes.SETTINGS_SCREEN: (context) => SettingsScreen(),
        Routes.FEEDBACK_SCREEN: (context) => FeedbackScreen(),
        Routes.PRIVACY_AND_TERMS_SCREEN: (context) => PrivacyScreen(),
        Routes.HOME_SCREEN: (context) => HomeScreen(),
        Routes.WANTED_LIST_SCREEN: (context) => WantedListScreen(),
        Routes.MISSING_PERSONS_SCREEN: (context) => MissingPersonsScreen(),
        Routes.PUBLIC_NOTICE_SCREEN: (context) => PublicNoticeScreen(),
        Routes.NOTIFICATION_SCREEN: (context) => NotificationScreen()
      },
    );
  }

  _setUpLocationTracking() {
    // Fired whenever a location is recorded
    bg.BackgroundGeolocation.onLocation((bg.Location location) {
      print('[location] - $location');
      OfficerResource.updateLocation({'lat': location.coords.latitude, 'lon': location.coords.longitude}, this);
    });

    // Fired whenever the plugin changes motion-state (stationary->moving and vice-versa)
    bg.BackgroundGeolocation.onMotionChange((bg.Location location) {
      OfficerResource.updateLocation({'lat': location.coords.latitude, 'lon': location.coords.longitude}, this);
    });

    // Fired whenever the state of location-services changes.  Always fired at boot
    bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
      print('[providerchange] - $event');
    });

    ////
    // 2.  Configure the plugin
    //
    bg.BackgroundGeolocation.ready(
      bg.Config(
        desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
        distanceFilter: 10.0,
        stopOnTerminate: false,
        startOnBoot: true,
        debug: true,
        logLevel: bg.Config.LOG_LEVEL_VERBOSE,
        notification: bg.Notification(
          smallIcon: "ic_stat_officer_app_logo",
          color: "#0000FF",
          title: "Police Officer",
          text: "Police Officer App is running in the background",
        ),
      ),
    );
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  print(jsonEncode(message));

  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }
  // Or do other work.
}
