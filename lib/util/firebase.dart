import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDb {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static void signInWithEmailAndPassword (String email, String password) async{
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static void signOut() async{
    await auth.signOut();
  }
}