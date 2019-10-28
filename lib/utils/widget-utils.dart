import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WidgetUtils {
  static BoxDecoration getDefaultGradientBackground() {
    return BoxDecoration(
      // Box decoration takes a gradient
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.2, 0.5, 0.7, 0.9],

        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.green[800],
          Colors.green[600],
          Colors.green[300],
          Colors.green[50],
        ],
      ),
    );
  }

  static BoxDecoration getLightGradientBackground() {
    return BoxDecoration(
      // Box decoration takes a gradient
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.1, 0.5, 0.7, 0.9],

        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
        ],
      ),
    );
  }

  static void showAlertDialog(BuildContext context, String title, String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Widget getLoaderWidget(String text) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
              width: 100.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                strokeWidth: 8.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(text)),
          ],
        ),
      ),
    );
  }

  static Widget getColoredLoaderWidget(String text, Color color) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
              width: 100.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 8.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  static void toastColored(String message, Color backgroundColor, Color textColor) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIos: 1, backgroundColor: backgroundColor, textColor: textColor, fontSize: 16.0);
  }

  static void successToast(String message) {
    toastColored(message, Colors.black.withOpacity(0.8), Colors.greenAccent);
  }

  static void errorToast(String message) {
    toastColored(message, Colors.black.withOpacity(0.8), Colors.redAccent);
  }

  static void infoToast(String message) {
    toastColored(message, Colors.black.withOpacity(0.8), Colors.blueAccent);
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
