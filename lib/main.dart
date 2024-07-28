import 'package:flutter/material.dart';
import 'package:imageslider/animated%201.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        

        body:MyApp()),
    );
  }
}