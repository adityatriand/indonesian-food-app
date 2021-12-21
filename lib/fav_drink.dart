import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'drink_new.dart';

void main() => runApp(MaterialApp(
    home: Fav_Drink()
));

class Fav_Drink extends StatefulWidget{
  _Fav_Drink createState() => _Fav_Drink();
}

class _Fav_Drink extends State<Fav_Drink>{
  final notesReference = FirebaseDatabase.instance.reference().child('drink');
  late List<Drink> items;
  late StreamSubscription<Event> _onNoteAddedSubscription;

  @override
  void initState(){
    super.initState();
    _onNoteAddedSubscription = notesReference.onChildAdded.listen((_onNoteAdded));
  }

  @override
  void dispose(){
    _onNoteAddedSubscription.cancel();
    super.dispose();
  }

  void _onNoteAdded(Event event){
    items.add(new Drink.fromSnapshot(event.snapshot));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text('Your Favorite Drink',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DrinkNew())
                        );
                      },
                      child: Text('Add Fav Drink',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber))
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, position){
                        return Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                                flex:2,
                                child: Image(
                                  image: AssetImage('images/image5.jpg'),
                                  width: 50,
                                )

                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                                flex:4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Drink Name = '+items[position].name),
                                    SizedBox(
                                        height: 10.0
                                    ),
                                    Text('Origin = '+items[position].origin),
                                  ],
                                )
                            ),
                          ],
                        );
                      }
                  ),
                ]
            )
        )
    );
  }

}


