import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// https://pub.dev/packages/font_awesome_flutter
// https://github.com/fluttercommunity/font_awesome_flutter
// https://fontawesome.com/icons
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:couchbase_lite_flutter/routes/page_routes.dart';
// import 'page_routes.dart';

import 'package:couchbase_lite_flutter/pages/main_page.dart' show MainPage;
import 'package:couchbase_lite_flutter/pages/login_page.dart' show LoginPage;
import 'package:couchbase_lite_flutter/pages/developer_page.dart' show DeveloperPage;

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
    required this.title,
    required this.user
  }) : super(key: key);
  final String title;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
        Column(children: <Widget>[
          Flexible(child: buildHeader(context, title, user)),
          Flexible(child: buildMenuItems(context, title, user)),
      ]),
    );
  }

  ListView buildHeader(
        BuildContext context,
        String title,
        String user
      ) =>
      ListView(shrinkWrap: true, padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
              accountName: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                'User: $user',
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontWeight: FontWeight.normal,
                ),
              ),
              currentAccountPicture:
                // FlutterLogo(),
                const CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage(
                    'assets/couchbase_logo.png',
                  ), //For Image Asset
                ),
              onDetailsPressed: () {
                if (kDebugMode) {
                  print(
                      'UserAccountsDrawer: onDetailsPressed...\n'
                      '-- Title: ${title}\n'
                      '-- User: ${user}');
                }
              },
            ),
          ]);

  ListView buildMenuItems(
      BuildContext context,
      String title,
      String user
      ) =>
      ListView(shrinkWrap: true, padding: EdgeInsets.zero, children: [
        ListTile(
          leading: const Icon(
            FontAwesomeIcons.rightFromBracket,
          ),
          title: const Text('Log In'),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
          ),
          title: const Text('Home'),
          onTap: () async {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MainPage(title: title, user: user)));
          },
        ),
        ListTile(
          leading: const Icon(
            FontAwesomeIcons.code,
          ),
          title: const Text('Developer'),
          onTap: () async {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DeveloperPage()));
          },
        ),
        // ListTile(
        //   leading: const Icon(
        //     FontAwesomeIcons.anchorCircleExclamation,
        //   ),
        //   title: const Text('Test'),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        const AboutListTile(
          icon: Icon(
            Icons.info,
          ),
          applicationIcon: Icon(
            Icons.local_play,
          ),
          applicationName: 'Flutter with Couchbase',
          applicationVersion: '0.1.0',
          applicationLegalese: '© 2022 MIT License',
          aboutBoxChildren: [
            ///Content goes here...
          ],
          child: Text('About'),
        ),
        ListTile(
          leading: const Icon(
            FontAwesomeIcons.circleArrowLeft,
          ),
          title: const Text('Log Out'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ]);
}
