import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text("Face Punch"),
      ),
    );
  }
}
