import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Bakso(),
));

class Bakso extends StatefulWidget{
  _Bakso createState() => _Bakso();
}

class _Bakso extends State<Bakso>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor : Colors.amber,
          title: Text('Bakso'),
        )
    );
  }

}