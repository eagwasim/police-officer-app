import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:police_officer_app/utils/navigation-utils.dart';
import 'package:police_officer_app/utils/widget-utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () async {
      String nextRoute = await NavigationUtils.getInitialAppRoute();
      Navigator.pushNamedAndRemoveUntil(context, nextRoute, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: WidgetUtils.getDefaultGradientBackground(),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Align(
                    alignment: FractionalOffset.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/officer_app_logo_with_white.png",
                          width: 200.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "POLICE NG",
                            style: TextStyle(fontSize: 40, letterSpacing: .1, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Officer",
                            style: TextStyle(fontSize: 30, letterSpacing: .1, fontWeight: FontWeight.normal, color: Colors.white),
                          ),
                        ),
                      ],
                    )),
              ),
              new Positioned(
                child: new Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Version 1.0",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
