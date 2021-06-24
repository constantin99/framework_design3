import 'package:cloud_firestore/cloud_firestore.dart';

class Movie{
  String id = 'id';
  String name = 'name';
  String genre = 'genre';
  String director = 'director';
  String image = 'image';
  String description = 'description';
  Timestamp createdAt = Timestamp.fromDate(DateTime.now());



  Movie.fromMap(Map<String, dynamic> data){
    id = data['id'];
    name = data['name'];
    genre = data['genre'];
    director = data['director'];
    image = data['image'];
    description = data['description'];
    createdAt = data['createdAt'];
  }
}

