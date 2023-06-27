import 'package:flutter/material.dart';

import 'Artwork.dart';

class MuseumApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.brown
      ),
      home: Artwork(),
    );
  }
}