import 'package:flutter/material.dart';

// https://pub.dev/packages/font_awesome_flutter
// https://github.com/fluttercommunity/font_awesome_flutter
// https://fontawesome.com/icons
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:couchbase_lite_flutter/routes/page_routes.dart';
// import 'page_routes.dart';

import 'package:couchbase_lite_flutter/pages/login_page.dart' show LoginPage;
import 'package:couchbase_lite_flutter/pages/home_page.dart' show HomePage;
import 'package:couchbase_lite_flutter/pages/developer_page.dart' show DeveloperPage;

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
        Column(children: <Widget>[
          Flexible(child: buildHeader(context)),
          Flexible(child: buildMenuItems(context)),
      ]),
    );
  }

  ListView buildHeader(BuildContext context) =>
      ListView(shrinkWrap: true, padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              accountName: Text(
                "Demo Couchbase Flutter User",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "demo_user@example.com",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontWeight: FontWeight.normal,
                ),
              ),
              currentAccountPicture:
                // FlutterLogo(),
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage(
                    'assets/couchbase_logo.png',
                  ), //For Image Asset
                ),
              onDetailsPressed: () {
                print('UserAccountsDrawer: onDetailsPressed...');
              },
            ),
          ]);

  ListView buildMenuItems(BuildContext context) =>
      ListView(shrinkWrap: true, padding: EdgeInsets.zero, children: [
        ListTile(
          leading: const Icon(
            Icons.home,
          ),
          title: const Text('Home'),
          onTap: () async {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
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
            FontAwesomeIcons.code,
          ),
          title: const Text('Developer'),
          onTap: () async {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DeveloperPage()));
          },
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
        ListTile(
          leading: const Icon(
            FontAwesomeIcons.anchorCircleExclamation,
          ),
          title: const Text('Test'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
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
        )
      ]);
}
