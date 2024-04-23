import 'package:firenote/pages/home_page.dart';
import 'package:firenote/util/string_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/firebase.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:umdb/pages/dashboard_page.dart';
// import 'package:umdb/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  // _saveAuthCredentials(bool value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final isAuthStored = await prefs.setBool('isAuth', value);
  //
  //   if (isAuthStored) {
  //     //checking for login page is visible or not
  //     if (mounted) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) {
  //           return const DashboardPage();
  //         }),
  //       );
  //     }
  //   }
  // }

  void _signInWithEmailAndPassword(String email, String password) {
    FirebaseDb.signInWithEmailAndPassword(email, password);
  }

  @override
  void initState() {
    super.initState();

    FirebaseDb.auth.authStateChanges().listen((user) {
      //fb il user undengil nexpage
      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text('Email'),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.isValidEmail()) {
                    return null;
                  }
                }
                return 'Username should be at  least 6 Characters';
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(label: Text("Password")),
              validator: (value) {
                if (value != null) {
                  if (value.length > 6) {
                    return null;
                  }
                }
                return 'Password should be at  least 6 Characters';
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                // final isValid = _formKey.currentState?.validate();
                // print('valid = $isValid');
                // if (isValid ?? false) {
                //   //save the isAuth value to sharedpreference
                //
                //   // _saveAuthCredentials(isValid!);
                // }

                final email = _emailController.text;
                final password = _passwordController.text;
                _signInWithEmailAndPassword(email, password);
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
