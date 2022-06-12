import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("This is the Developer page"),
        ),
        body: const Center(child: Text("This is my developer page!")));
  }
}
