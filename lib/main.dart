import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

// https://pub.dev/packages/font_awesome_flutter
// https://github.com/fluttercommunity/font_awesome_flutter
// https://fontawesome.com/icons
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final MaterialApp myMaterialApp;
    final Scaffold myAppScaffold;
    myAppScaffold =
      const Scaffold(
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          onPressed: null, // used by assistive technologies
          child: Icon(Icons.add),
        ),
      );
    myMaterialApp =
        MaterialApp(
          title: 'Couchbase Lite Flutter Demo',
          initialRoute: '/',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: const MyHomePage(title: 'Couchbase Lite Flutter Demo'),
        );
    return myMaterialApp;
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
      drawer: const NavigationDrawer()
    );
  }
}
