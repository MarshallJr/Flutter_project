import 'env.dart' as secret;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}*/
void main() => runApp(MyApp(post: fetchPost()));

String baseUrl = "https://api.foursquare.com/v2/venues/search?client_id="+secret.clientId+"&client_secret="+secret.secretId+"&v=20180323&limit=1&ll=40.7243,-74.0018&near=Nantes";

Future<Post> fetchPost() async {
  final response =  await http.get(baseUrl);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final String name;
  final int distance;

  Post({this.name,this.distance});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      name: json['name'],
      distance: json['distance'],
    );
  }
}


/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = '♥ Kinder ♥';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor:Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            }),
          ],
          title: new Center(
            child : new Text( _title),
          ),
        ),
        body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Entrez la localisation :',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez entrer une localisation';
                }
                return null;
              },
            ),
            TextFormField(
              scrollPadding: EdgeInsets.symmetric(vertical: 5.0),
              decoration: InputDecoration(
                labelText: 'Entrez la localisation :',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez entrer une localisation';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Entrez la localisation :',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez entrer une localisation';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Rechercher'),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}