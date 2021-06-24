
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:framework_design3/Notifiers/movie_notifier.dart';
import 'package:provider/provider.dart';

class MovieDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    MovieNotifier movieNotifier = Provider.of<MovieNotifier>(context,  listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(movieNotifier.currentMovie.name),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              //solving the full screen photo for usual suspects
              SizedBox(
                height: MediaQuery.of(context).size.height/2,
                child: Image.network(
                  movieNotifier.currentMovie.image,
                ),
              ),
              SizedBox(height: 32,
              ),
              Text(movieNotifier.currentMovie.name,
              style: TextStyle(
                fontSize: 40,
              ),
              ),
              Text(
                movieNotifier.currentMovie.director,
                style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              ),
              Text(
                movieNotifier.currentMovie.genre,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                movieNotifier.currentMovie.description,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}