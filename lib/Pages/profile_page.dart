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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 48, 48, 48), // darkish grey background
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
            Padding(
              padding: const EdgeInsets.only(left: 130, right: 130),
              child: ElevatedButton(
                onPressed: () {
                  pickuploadImage();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.edit),
                    SizedBox(width: 5),
                    Text('Edit Profile'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 170),
            Container(
              alignment: Alignment.bottomCenter,
              child: TextButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            title: const Text("About this app"),
                            content: const Text(
                                "NextMovie is a passion project created by Ajaz Imran. This app allows users to easily sign up and browse through the latest movies and TV shows. With endless lists of titles to choose from, users can easily customize their profile to keep track of their favorite picks. For any feedback, definetly DONT reach out to me at: \n\nma-mohamed-imran@uclan.ac.uk. \n\nThank you for using NextMovie and happy browsing!"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"))
                            ],
                            backgroundColor:
                                const Color.fromARGB(255, 179, 178, 178),
                          ),
                        );
                      });
                },
                icon: const Icon(
                  Icons.info,
                  color: Colors.grey,
                ),
                label: const Text(
                  'App Info',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
