// ignore_for_file: must_call_super

import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leave/common.dart';
import 'package:flutter_leave/forgotpswd.dart';
import 'package:flutter_leave/services/pgadmin.dart';
import 'package:flutter_leave/signup.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:postgres/postgres.dart';

import 'dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final mlc = TextEditingController();
  final pwd = TextEditingController();
  final fk = GlobalKey<FormState>();
  bool obscureTextP = true;
  bool isChecked = false;

  @override
  void initState() {
    obscureTextP = true;
  }

  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  //return true when click on "Yes"
                  child: Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: Text('No'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: FooterView(
            footer: Footer(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.all(10.0),
              child: const Text("© 2023 Sypram Technology"),
            ),
            children: [
              SingleChildScrollView(
                child: Form(
                  key: fk,
                  child: Column(
                    children: <Widget>[
                      // Image.network(
                      //     'https://img.freepik.com/free-vector/people-doodle-vector-happy-workers-green-office-characters_53876-143503.jpg',
                      //     width: 100,
                      //     height: 100),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 30.0, left: 13.0, right: 13.0),
                        child: Image.asset(
                          'lib/assets/ghi.png',
                          width: 475,
                          height: 250,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                        child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Enter email to login.";
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                                return "Invalid Email.";
                              else
                                null;
                            },
                            controller: mlc,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              // labelText: AutofillHints.email,
                              labelText: "Email",
                              border: OutlineInputBorder(),
                              hintText: 'Enter email here.',
                              suffixIcon: (Icon(
                                Icons.mail_sharp,
                                color: Theme.of(context).primaryColorDark,
                              )),
                            )),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 13.0, right: 13.0),
                          child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return "Enter password to login.";
                                if (!RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(value))
                                return "Enter valid password.";
                                else
                                  null;
                              },
                              controller: pwd,
                              obscureText: obscureTextP,
                              decoration: InputDecoration(
                                  // labelText: AutofillHints.password,
                                  labelText: "Password",
                                  border: const OutlineInputBorder(),
                                  hintText: 'Enter password here.',
                                  suffixIcon: IconButton(
                                    icon: (obscureTextP
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                    color: Theme.of(context).primaryColorDark,
                                    onPressed: () {
                                      setState(() {
                                        obscureTextP = !obscureTextP;
                                      });
                                    },
                                  )))),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 13.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'Forgot Password?',
                                style: TextStyle(
                                    color: Colors.deepPurple, fontSize: 17),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => hereF()));
                                  },
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      ElevatedButton(
                        child:
                            const Text('Login', style: TextStyle(fontSize: 17)),
                        onPressed: () {
                          if (fk.currentState!.validate()) {
                            operation(mlc.text, pwd.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => hereD()),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                    color: Colors.deepPurple, fontSize: 17),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => hereS()));
                                  },
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
