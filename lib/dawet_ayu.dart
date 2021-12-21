import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Dawet_Ayu(),
));

class Dawet_Ayu extends StatefulWidget{
  _Dawet_Ayu createState() => _Dawet_Ayu();
}

class _Dawet_Ayu extends State<Dawet_Ayu>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor : Colors.amber,
          title: Text('Dawet Ayu'),
        )
    );
  }

}