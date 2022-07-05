import 'package:couchbase_lite_flutter/pages/main.dart';
import 'package:flutter/material.dart';

import 'package:couchbase_lite_flutter/pages/home_page.dart' show HomePage;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.deepPurpleAccent,
                Colors.lightBlue,
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
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                  ),
                ),
                TextButton(
                  child: Text(
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const HomePage()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                // Text('New User? Create Account')
                Row(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ))
    );
  }
}
