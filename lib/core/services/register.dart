import 'package:firebase_auth/firebase_auth.dart';

class RegisterService {
  FirebaseAuth auth = FirebaseAuth.instance;
  register(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
