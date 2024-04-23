

import 'package:firenote/pages/login_page.dart';
import 'package:firenote/util/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _signOut() {
    FirebaseDb.signOut();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    FirebaseDb.auth.authStateChanges().listen((user) {
      //fb il user undengil nexpage
      if (user == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          IconButton(onPressed: () {
            _signOut();
            }, icon: Icon(Icons.power_settings_new))
        ],
      ),
    );
  }
}
