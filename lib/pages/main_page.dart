import 'dart:async';

import 'package:flutter/material.dart';

// https://pub.dev/packages/intl
import 'package:intl/intl.dart';

// my package imports
import 'package:couchbase_lite_flutter/pages/navigation_drawer.dart' show NavigationDrawer;
import 'package:couchbase_lite_flutter/pages/login_page.dart' show LoginPage;

// https://pub.dev/packages/font_awesome_flutter
// https://github.com/fluttercommunity/font_awesome_flutter
// https://fontawesome.com/icons
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://pub.dev/packages/cbl
// https://pub.dev/documentation/cbl/latest/
import 'package:cbl/cbl.dart';
import 'package:cbl_flutter/cbl_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        drawer: const NavigationDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text(
            'Couchbase Lite Flutter Demo',
          ),
        ),
        body:
          Center(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.deepPurpleAccent,
                      Colors.lightBlue.shade100,
                    ],
                  )
            ))),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Couchbase Lite Flutter Demo'),
              ));
            },
          )
      )
    );
  }
}
