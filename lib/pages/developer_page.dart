import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is my Developer Page"),
      ),
      body:
        // Center(child: Text("This is my Developer Page!")),
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                InkWell(
                  // onTap: () {
                  //   print("Developer Page Card Clicked !!"); }, //TODO!! remove
                  child: Card(
                    child: Icon(
                      Icons.code,
                      size: 300,
                    ),
                  ),
                ),
              ]
          ),
        ),
    );
  }
}
