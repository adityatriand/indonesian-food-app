import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Profile()
));

class Profile extends StatefulWidget{
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text('Your Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                          SizedBox(
                            height: 30,
                          ),
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage('images/user.jpg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nama'),
                          Text('Email'),
                          Text('No. Matrix'),
                          Text('Hobby')
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(': Aditya Tri Ananda'),
                            Text(': adityatriananda0@gmail.com '),
                            Text(': E00200'),
                            Text(': Learn New Something')
                          ],
                        )
                    ),
                  ],
                )
              ]
            )
        )
    );
  }
  
}


