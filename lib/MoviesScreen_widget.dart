import 'package:flutter/material.dart';
import 'package:framework_design3/Functions/authentication_api.dart';
import 'package:framework_design3/functions/authentication.dart';
import 'package:provider/provider.dart';

import 'Notifiers/authentication_notifier.dart';

class MoviesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MoviesScreenState();
  }
}

class _MoviesScreenState extends State<MoviesScreen>{
  @override
  Widget build(BuildContext context) {
    AuthenticationNotifier authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        actions: <Widget>[
          TextButton(
              onPressed: () => signOut(authenticationNotifier),
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.green[400],
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              )
          ),
        ],
      ),
      body: Text("My Movies"),
    );
  }
}