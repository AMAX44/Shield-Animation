import 'package:flutter/material.dart';
import 'basic_animation.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title : 'Flutter Demo',
      theme : ThemeData(
        primarySwatch : Colors.blue,
      ),
      home: AnimationPage(),
    );
  }
}