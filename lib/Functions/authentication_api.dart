
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:framework_design3/Models/movie.dart';
import 'package:framework_design3/Models/user.dart';
import 'package:framework_design3/Notifiers/authentication_notifier.dart';
import 'package:framework_design3/Notifiers/movie_notifier.dart';

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

getMovies(MovieNotifier movieNotifier) async{
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Movies').get();

  List<Movie> _movieList = [];

  querySnapshot.docs.forEach((element) {
    Movie movie = Movie.fromMap(element.data());
    _movieList.add(movie);
  });

  movieNotifier.movieList = _movieList;
}