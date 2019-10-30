import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:police_officer_app/utils/route.dart';

class Choice {
  const Choice({this.title, this.icon, this.route});

  final String title;
  final IconData icon;
  final String route;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'ACCOUNT', icon: Icons.account_circle, route: Routes.PROFILE_SCREEN),
  const Choice(title: 'SETTING', icon: Icons.settings, route: Routes.SETTINGS_SCREEN),
  const Choice(title: 'FEEDBACK', icon: Icons.feedback, route: Routes.FEEDBACK_SCREEN),
  const Choice(title: 'GO OFFLINE', icon: Icons.adjust, route: Routes.FEEDBACK_SCREEN),
];

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class Report {}

class _HomeState extends State with SingleTickerProviderStateMixin {
  final reports = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          "OFFICER",
          style: TextStyle(color: Colors.grey[700]),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset("assets/images/officer_app_logo.png"),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.adjust,
              color: Colors.grey[700],
            ),
            tooltip: "Message",
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.message,
              color: Colors.grey[700],
            ),
            onPressed: () {},
          ),
          _glowingNotification(),
          PopupMenuButton<Choice>(
            onSelected: (choice) {
              if (choice.title != "GO OFFLINE") Navigator.pushNamed(context, choice.route);
            },
            icon: Icon(
              Icons.account_circle,
              color: Colors.grey[700],
            ),
            itemBuilder: (BuildContext context) {
              return choices.map(
                (Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0.0, right: 8.0),
                          child: Icon(
                            choice.icon,
                            color: Colors.grey[700],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 2.0, right: 0.0),
                          child: Text(
                            choice.title,
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildTopWidget("9/10", "RESOLVED TODAY", Colors.orange[600]),
                    VerticalDivider(),
                    _buildTopWidget("128", "ENGUAGED (YTD)", Colors.blue[600]),
                    VerticalDivider(),
                    _buildTopWidget("115", "RESOLVED (YTD)", Colors.green[600]),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      color: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "REQUEST BACKUP",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      OrderedListItem(
                        imageAsset: "most_wanted.png",
                        textLabel: "Wanted List",
                        callback: () {
                          // Navigator.pushNamed(context, Routes.WANTED_LIST_SCREEN);
                        },
                      ),
                      Divider(),
                      OrderedListItem(
                        imageAsset: "missing_items.png",
                        textLabel: "Missing Persons/Items",
                        callback: () {
                          // Navigator.pushNamed(context, Routes.MISSING_PERSONS_SCREEN);
                        },
                      ),
                      Divider(),
                      OrderedListItem(
                        imageAsset: "notices.png",
                        textLabel: "Public Notices",
                        callback: () {
                          // Navigator.pushNamed(context, Routes.PUBLIC_NOTICE_SCREEN);
                        },
                      ),
                      Divider(),
                      OrderedListItem(
                        imageAsset: "send_sms.png",
                        textLabel: "Send Security Advice",
                        callback: () {
                          // Navigator.pushNamed(context, Routes.PUBLIC_NOTICE_SCREEN);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Latest Incident",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "DISTRESS",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[600]),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Today | 12:15 PM",
                                textAlign: TextAlign.end,
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "My shop has just been attacked by some hoodlums who claim to be from the community chairman. They are destroying all my properties and saying that they will soon burn my shop. Please help, I have received two blows already and they at least one of them has a gun.",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Divider(),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "VIEW ALL INCIDENTS",
                                style: TextStyle(color: Colors.indigo),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopWidget(String mainText, String subText, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              mainText,
              style: TextStyle(color: color, fontSize: 30),
            ),
            Text(
              subText,
              style: TextStyle(color: Colors.grey[700], fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

class OrderedListItem extends StatelessWidget {
  final String imageAsset;
  final String textLabel;
  final VoidCallback callback;

  const OrderedListItem({Key key, this.imageAsset, this.textLabel, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/$imageAsset",
                width: 30,
              ),
            ),
            Expanded(child: Text(textLabel)),
            Icon(
              Icons.navigate_next,
              color: Colors.orange[700],
            )
          ],
        ),
        onTap: callback,
      ),
    );
  }
}

Widget _glowingNotification() {
  return AvatarGlow(
    startDelay: Duration(milliseconds: 2000),
    glowColor: Colors.red,
    endRadius: 20.0,
    duration: Duration(milliseconds: 2000),
    repeat: true,
    showTwoGlows: true,
    shape: BoxShape.circle,
    repeatPauseDuration: Duration(milliseconds: 100),
    child: IconButton(
      icon: Icon(
        Icons.notifications_none,
        color: Colors.red.withOpacity(0.8),
      ),
      onPressed: () {},
    ),
  );
}
