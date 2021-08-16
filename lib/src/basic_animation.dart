import 'package:flutter/material.dart';
import 'dart:math'as math;

class AnimationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationPageState();
  }
}

class AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{

  AnimationController animController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animController = AnimationController(
      duration : Duration(seconds: 6),
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: animController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOut,
    );



    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(curvedAnimation)
     ..addListener((){
       setState(() {});
     })
       ..addStatusListener((status){
         if(status == AnimationStatus.completed){
          animController.reverse();
         } else if (status == AnimationStatus.dismissed){
           animController.forward();
         }
       });
    animController.forward();
  }
  


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff9370DB),
      appBar: AppBar(
        backgroundColor : Color(0xff7B68EE),
        title : Text('CAPTAIN SHIELD!!!'),
      ),
      body: Transform.rotate(
        angle : animation.value,
        child : Container(
          alignment : Alignment.center,
          padding : EdgeInsets.all(30),
          child : Image.asset('assets/captainAmerica.png')
        )
      ),
    );
  }
  @override
  void dispose() {
    animController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}