import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("This is Home"),
        ),
        body: const Center(child: Text("This is my home page!")));
  }
}