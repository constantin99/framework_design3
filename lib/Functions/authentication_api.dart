
import 'package:firebase_auth/firebase_auth.dart';
import 'package:framework_design3/Models/user.dart';
import 'package:framework_design3/Notifiers/authentication_notifier.dart';

logIn(Users user, AuthenticationNotifier authenticationNotifier) async{

  UserCredential newUser = await FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password)
  .catchError((error) => print(error.toString().trim()));

 if(newUser != null){
   User firebaseUser = newUser.user;

   if(firebaseUser != null){
     print("Log in: $firebaseUser");
     authenticationNotifier.setUser(firebaseUser);
   }
 }
}

signUp (Users user, AuthenticationNotifier authenticationNotifier) async{
  UserCredential newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.toString().trim()));

  if(newUser != null){
    User firebaseUser = newUser.user;

    if(firebaseUser != null){
      print("Log in: $firebaseUser");
      authenticationNotifier.setUser(firebaseUser);
    }
  }
}

signOut(AuthenticationNotifier authenticationNotifier) async{
  await FirebaseAuth.instance.signOut().catchError((error) => print(error.toString().trim()));

  authenticationNotifier.setUser(FirebaseAuth.instance.currentUser);
}

initializeCurrentUser(AuthenticationNotifier authenticationNotifier) async{
  User firebaseUser = await FirebaseAuth.instance.currentUser;

  if(firebaseUser != null){
    authenticationNotifier.setUser(firebaseUser);
  }

}