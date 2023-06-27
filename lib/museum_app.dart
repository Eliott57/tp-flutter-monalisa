import 'package:flutter/material.dart';

import 'artwork.dart';

class MuseumApp extends StatelessWidget{
  MuseumApp() : super(key: GlobalKey());

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