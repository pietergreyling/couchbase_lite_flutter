import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("This is Home"),
      ),
      body:
        // Center(child: Text("This is my home page!")),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              InkWell(
                // onTap: () {
                //   print("Home Card Clicked !!"); }, //TODO!! remove
                child: Card(
                  child: Icon(
                    Icons.fingerprint,
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
