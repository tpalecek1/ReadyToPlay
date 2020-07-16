import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future loginWithEmail(String email, String password) async {
    AuthResult authResult;
    try {
      authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw e.message;
    }
    return authResult.user.uid;
  }
  Future signUpwWithEmail(String email, String password) async {
    AuthResult authResult;
    try{
      authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      throw e.message;
    }
    return authResult.user.uid;
  }
}