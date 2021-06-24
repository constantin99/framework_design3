
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:framework_design3/LoginScreen_widget.dart';
import 'package:framework_design3/MoviesScreen_widget.dart';
import 'package:framework_design3/Notifiers/authentication_notifier.dart';
import 'package:framework_design3/Notifiers/movie_notifier.dart';
import 'package:framework_design3/functions/authentication.dart';
import 'package:framework_design3/login_widget.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticationNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieNotifier(),
        ),
      ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "My movies",
      home: Consumer<AuthenticationNotifier>(
        builder: (context, notifier, child){
          return notifier.user != null ? MoviesScreen() : Login();
        },
      ),
    );
  }
}



//Another Authentication method!!!

//void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//
//  await Firebase.initializeApp();
//  runApp(MyApp());
//
//}




//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MultiProvider(
//        providers: [
//          Provider<AuthenticationService>(
//            create: (_) => AuthenticationService(FirebaseAuth.instance),
//          ),
//          StreamProvider(
//            create: (context) => context.read<AuthenticationService>().authStateChanges,
//          ),
//        ],
//      child: MaterialApp(
//        title: "My movies app",
//        home: AuthenticationWrapper(),
//      ),
//    );
//  }
//}
//
//class AuthenticationWrapper extends StatelessWidget{
//  @override
//  Widget build(BuildContext context){
//    final user = context.watch<User>();
//
//    if(user != null){
//      return MoviesScreen();
//    }
//    return LoginScreen();
//  }
//}


