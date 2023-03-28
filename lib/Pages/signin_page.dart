// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextmovie_v2/Pages/home_page.dart';
import 'package:nextmovie_v2/Pages/signup_page.dart';
import 'package:nextmovie_v2/utilities/color_utils.dart';
import 'package:nextmovie_v2/reusable_widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nextmovie_v2/utilities/navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Sign In Screen Widget
class signinScreen extends StatefulWidget {
  const signinScreen({super.key});

  @override
  State<signinScreen> createState() => _signinScreenState();
}

class _signinScreenState extends State<signinScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor('2E2E2E'),
          hexStringToColor('2E2E2E'),
          hexStringToColor('111111')
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(children: <Widget>[
            logoWidget("assets/images/NextMovieLogo.png"),
            SizedBox(
              height: 20,
            ),
            reusableTextField(
                "Enter Email", Icons.mail_outline, false, _emailTextController),
            SizedBox(
              height: 25,
            ),
            reusableTextField("Enter Password", Icons.lock_outline, true,
                _passwordTextController),
            SizedBox(
              height: 25,
            ),
            signInsignUpButtons(context, true, () async {
              try {
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                     FirebaseFirestore.instance.collection('UserData').doc(value.user!.uid).set({"email": value.user!.email});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainNavigator(),
                      ));
                });
              } on FirebaseAuthException catch (error) {
                print(error.message);
                Fluttertoast.showToast(
                    msg: error.message.toString(), gravity: ToastGravity.TOP);
              }
              // using firebase api checks whether email and password is correct registered
            }),
            signUpOption(),
          ]),
        )),
      ),
    );
  }

  // SignUp text bolded and linked to the signup page
  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Dont have an account?',
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            ' Sign up',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
