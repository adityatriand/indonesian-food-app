import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Kembang_Tahu(),
));

class Kembang_Tahu extends StatefulWidget{
  _Kembang_Tahu createState() => _Kembang_Tahu();
}

class _Kembang_Tahu extends State<Kembang_Tahu>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor : Colors.amber,
          title: Text('Kembang Tahu'),
        )
    );
  }

}