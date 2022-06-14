import 'dart:async';

// https://pub.dev/packages/cbl
// https://pub.dev/documentation/cbl/latest/
import 'package:cbl/cbl.dart';
import 'package:cbl_flutter/cbl_flutter.dart';

import 'package:flutter/material.dart';

// https://pub.dev/packages/intl
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// my package imports
import 'navigation_drawer.dart';

// https://pub.dev/packages/font_awesome_flutter
// https://github.com/fluttercommunity/font_awesome_flutter
// https://fontawesome.com/icons
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final MaterialApp myMaterialApp;

    myMaterialApp = MaterialApp(
      title: 'Couchbase Lite Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Couchbase Lite Flutter Demo'),
    );
    return myMaterialApp;
    // return myAppScaffold;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          title: const Text(
            'Couchbase Lite Flutter Demo',
          ),
        ),
        drawer: const NavigationDrawer(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Couchbase Lite Flutter Demo'),
            ));
          },
        ));
  }
}
