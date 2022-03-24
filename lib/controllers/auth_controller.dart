import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _firebaseStore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;
  signinWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          //we want to save the user in the firestore database

          _firebaseStore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'userImage': user.photoURL
          });
        } else {
          ///
        }
      }
    } catch (e) {}
  }
}
