import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'User 1'; // default name
  String imageUrl = " ";
  late SharedPreferences prefs;

  void pickuploadImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 75,
    );

    Reference ref = FirebaseStorage.instance.ref().child("profilepic.jpg");

    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      print(value);
      setState(() {
        imageUrl = value;
        prefs.setString('imageUrl', imageUrl);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadPrefs();
  }

  void loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      imageUrl = prefs.getString('imageUrl') ?? '';
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800], // darkish grey background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: imageUrl == " "
                  ? const Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white,
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.black,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                pickuploadImage();
              },
              child: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
    /*return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: imageUrl == " "
                    ? const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.white,
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );*/
  }
}
