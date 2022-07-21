import 'dart:async';

import 'package:flutter/material.dart';

// https://pub.dev/packages/intl
import 'package:intl/intl.dart';

// https://pub.dev/packages/font_awesome_flutter
// https://github.com/fluttercommunity/font_awesome_flutter
// https://fontawesome.com/icons
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://pub.dev/packages/cbl
// https://pub.dev/documentation/cbl/latest/
import 'package:cbl/cbl.dart';
import 'package:cbl_flutter/cbl_flutter.dart';

// my package imports
import 'package:couchbase_lite_flutter/pages/navigation_drawer.dart' show NavigationDrawer;

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.title,
    required this.user
  }) : super(key: key);
  final String title;
  final String user;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        drawer: NavigationDrawer(
          title: super.widget.title,
          user: super.widget.user
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          title: Text(
            super.widget.title
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
