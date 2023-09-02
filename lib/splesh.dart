import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/main.dart';

class splesh extends StatefulWidget{

  @override
  State<splesh> createState() => _spleshState();
}

class _spleshState extends State<splesh> {
  bool isfirst = true;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
    }
    );
    Timer(Duration(milliseconds: 100),(){
      relod();
    });
  }
  void relod(){
    setState(() {
      isfirst=false;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedCrossFade(
          duration: Duration(seconds: 2),
          firstChild: Container(
            height: 600,
            width: 600,
          ),
          secondChild: Image.asset('assets/bmi.jpg'),
          crossFadeState: isfirst ? CrossFadeState.showFirst:CrossFadeState.showSecond,
        ),
      ),
    );
  }
}