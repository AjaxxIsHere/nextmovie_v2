import 'package:flutter/material.dart';
import 'package:nextmovie_v2/Pages/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

// Main app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // sets up to only view in portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

// Moves to the signin screen
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
