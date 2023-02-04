import 'package:flutter/material.dart';
import 'package:nextmovie_v2/Pages/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Next Movie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const signinScreen(),
    );
  }
}

//28:00