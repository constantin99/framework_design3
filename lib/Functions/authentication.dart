import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{
  final FirebaseAuth _auth;

  AuthenticationService(this._auth);

  Stream<User> get authStateChanges => _auth.idTokenChanges();

  Future<String> login(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Logged in";
    } catch(e) {
      return e.toString().trim();
    }
  }

  Future<String> signUp(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed Up";
    } catch(e){
      return e.toString().trim();
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(e){
      return e.toString().trim();
    }
  }

}