import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/fav_drink.dart';
import 'package:flutter_myapp/fav_food.dart';
import 'home.dart';
import 'profile.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyHome(),
));

class MyHome extends StatefulWidget{
  _MyHome createState() => _MyHome();
}

class _MyHome extends State<MyHome>{
  late Widget mainWidget;

  void initState(){
    mainWidget = Home();
    super.initState();
  }

  void dispose(){
    super.dispose();
  }

  _loadingExit(){
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return Dialog(
            child: Row(
              children: [
                CircularProgressIndicator(),
                Text('Loading')
              ],
            ),
          );
        });
    Future.delayed(Duration(seconds: 1),(){
      Navigator.pop(context);
      exit(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Indonesian Food and Drink')
      ),
      body: Container(
        child: mainWidget,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.amberAccent
              ),
              child: Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('images/user.jpg'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('Aditya Tri Ananda',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('adityatriananda0@gmail.com',style: TextStyle(fontSize: 12.0),)
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){
                setState(() {
                  mainWidget = Home();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: (){
                setState(() {
                  mainWidget = Profile();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: Text('Favorite Food'),
              onTap: (){
                setState(() {
                  mainWidget = Fav_Food();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.emoji_food_beverage),
              title: Text('Favorite Drink'),
              onTap: (){
                setState(() {
                  mainWidget = Fav_Drink();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: (){
                _loadingExit();
              },
            )
          ],
        ),
      ),
    );
  }
}