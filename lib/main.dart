// import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

// https://pub.dev/packages/intl
import 'package:intl/intl.dart';

// my package imports
import 'package:couchbase_lite_flutter/pages/main_page.dart' show MainPage;
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
// import 'package:cbl_flutter_ce/cbl_flutter_ce.dart';
// import 'package:cbl_flutter_ee/cbl_flutter_ee.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TracingDelegate.install(DevToolsTracing());
  await CouchbaseLiteFlutter.init();
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
      home:
        // const MainPage(title: 'Couchbase Lite Flutter Demo'),
        const LoginPage(),
    );
    return myMaterialApp;
    // return myAppScaffold;
  }
}
