import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
                  // onTap: ()
                  //   { print("Card Clicked !!"); },
                  child: Card(
                    child: Icon(
                      Icons.fingerprint,
                        size: 100,
                    ),
                  ),
                ),
              ]
    ),
    );
};
