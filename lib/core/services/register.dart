import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanalira_case/view/bank_view.dart';

class RegisterService {
  FirebaseAuth auth = FirebaseAuth.instance;
  register(email, password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BankView()),
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
