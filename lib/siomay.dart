import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Siomay(),
));

class Siomay extends StatefulWidget{
  _Siomay createState() => _Siomay();
}

class _Siomay extends State<Siomay>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor : Colors.amber,
        title: Text('Siomay'),
      )
    );
  }

}