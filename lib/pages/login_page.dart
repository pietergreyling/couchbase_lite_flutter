import 'dart:io';

import 'package:flutter/material.dart';

// https://pub.dev/packages/intl
import 'package:intl/intl.dart';

import 'package:path_provider/path_provider.dart';

// https://pub.dev/packages/cbl
// https://pub.dev/documentation/cbl/latest/
import 'package:cbl/cbl.dart';
import 'package:cbl_flutter/cbl_flutter.dart';
// import 'package:cbl_flutter_ce/cbl_flutter_ce.dart';
import 'package:cbl_flutter_ee/cbl_flutter_ee.dart';

import 'package:couchbase_lite_flutter/pages/main_page.dart' show MainPage;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _LoginPageState extends State<LoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final _useridTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final String _userProfileDbName = "userprofile";
  // late final AsyncDatabase _userProfileDb;
  late final Database _userProfileDb;
  late final Directory _appFilesDirectory;

  _LoginPageState() {
    // initialise user profile from database (if exists)
    initUserProfileDb();
  }

  void initUserProfileDb() async {
  // void initUserProfileDb() {
    // configure work directory and logging
    _appFilesDirectory = await getApplicationDocumentsDirectory();
    // make sure it exists
    _appFilesDirectory.create(recursive: true);
    Database.log.file.config = LogFileConfiguration(directory: _appFilesDirectory.path);
    Database.log.console.level = LogLevel.info;

    // open user profile database
    _userProfileDb = Database.openSync(_userProfileDbName);

  }

  @override
  void dispose() {
    // free db resources
    _userProfileDb.close();

    // Clean up the controllers when the widget is disposed.
    _useridTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.deepPurpleAccent,
                Colors.lightBlue.shade100,
              ],
            )
        ),
        child: Scaffold(
          // backgroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text("Log In"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50.0)),
                          child:
                          Image.asset('assets/icon/ic_launcher_round.png')),
                    ),
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: TextField(
                      controller: _useridTextController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User ID or Email',
                          hintText: 'Enter a valid user id or email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: _passwordTextController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    // onPressed: (){
                    //     // Navigator.push(
                    //     //     context, MaterialPageRoute(builder: (_) => const HomePage()));
                    //     print("Forgot Password? clicked !!");  //TODO!! remove
                    // },
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Forgot Password? clicked !!'),
                      ));
                    },
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      onPressed: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (context) {
                        //     return AlertDialog(
                        //       // Retrieve the text that the user has entered by using the
                        //       // TextEditingController.
                        //       content: Text(
                        //               'User ID: ${useridTextController.text} \nPassword: ${passwordTextController.text}'),
                        //     );
                        //   },
                        // );
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) =>
                            MainPage(
                              title: 'Couchbase Lite Flutter Demo',
                              user: _useridTextController.text
                            )));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  // Text('New User? Create Account')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Do not have an account?'),
                      TextButton(
                        child: const Text(
                          'Sign up here',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          //signup screen
                        },
                      )
                    ],
                  ),
                ],
              ),
            ))
    );
  }
}
