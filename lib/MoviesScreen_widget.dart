import 'package:flutter/material.dart';
import 'package:framework_design3/Functions/authentication_api.dart';
import 'package:framework_design3/MovieDetails.dart';
import 'package:framework_design3/Notifiers/movie_notifier.dart';
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

  //getting data from firebase
  @override
  void initState(){
    MovieNotifier movieNotifier = Provider.of<MovieNotifier>(context, listen: false);
    getMovies(movieNotifier);

  }

  @override
  Widget build(BuildContext context) {
    AuthenticationNotifier authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
    MovieNotifier movieNotifier = Provider.of<MovieNotifier>(context);

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
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            //image retriever
            leading: Image.network(movieNotifier.movieList[index].image,
            width: 120,
            fit: BoxFit.fitHeight,
            ),
            title: Text(movieNotifier.movieList[index].name),
            subtitle: Text(movieNotifier.movieList[index].director),
            onTap: (){
              movieNotifier.currentMovie = movieNotifier.movieList[index];
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context){
                return MovieDetail();
                }),
              );
            },
          );
        },
        itemCount: movieNotifier.movieList.length,
        separatorBuilder: (BuildContext context, int index){
          return Divider(
            color: Colors.black,
          );
        },
      ),
    );
  }
}