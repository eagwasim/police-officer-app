import 'package:flutter/material.dart';
import 'package:police_officer_app/screens/feedback-screen.dart';
import 'package:police_officer_app/screens/home-screen.dart';
import 'package:police_officer_app/screens/login-screen.dart';
import 'package:police_officer_app/screens/missing-persons-screen.dart';
import 'package:police_officer_app/screens/phone-code-verification-screen.dart';
import 'package:police_officer_app/screens/privacy-screen.dart';
import 'package:police_officer_app/screens/profile-update-screen.dart';
import 'package:police_officer_app/screens/public-notice-screen.dart';
import 'package:police_officer_app/screens/settings-screen.dart';
import 'package:police_officer_app/screens/splash-screen.dart';
import 'package:police_officer_app/screens/wanted-list-screen.dart';
import 'package:police_officer_app/utils/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        Routes.PUBLIC_NOTICE_SCREEN: (context) => PublicNoticeScreen()
      },
    );
  }
}
