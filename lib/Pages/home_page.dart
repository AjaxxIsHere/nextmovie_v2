// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextmovie_v2/Pages/signin_page.dart';

class homescreenPage extends StatefulWidget {
  const homescreenPage({super.key});

  @override
  State<homescreenPage> createState() => _homescreenPageState();
}

class _homescreenPageState extends State<homescreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Next Movie")),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed Out");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const signinScreen()));
              });
            },
            child: const Text("Logout")),
      ),
    );
  }
}
