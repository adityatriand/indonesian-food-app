import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'food_new.dart';

void main() => runApp(MaterialApp(
    home: Fav_Food()
));

class Fav_Food extends StatefulWidget{
  _Fav_Food createState() => _Fav_Food();
}

class _Fav_Food extends State<Fav_Food>{
  final notesReference = FirebaseDatabase.instance.reference().child('food');
  List<Food> items = [];
  late StreamSubscription<Event> _onNoteAddedSubscription;

  @override
  void initState(){
    super.initState();
    items = [];
    _onNoteAddedSubscription = notesReference.onChildAdded.listen((_onNoteAdded));
  }

  @override
  void dispose(){
    _onNoteAddedSubscription.cancel();
    super.dispose();
  }

  void _onNoteAdded(Event event){
    items.add(new Food.fromSnapshot(event.snapshot));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Text('Your Favorite Food', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FoodNew())
                          );
                        },
                        child: Text('Add Fav Food',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber))
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // ListView.builder(
                  //     itemCount: items.length,
                  //     itemBuilder: (context, position){
                  //       return Row(
                  //         children: [
                  //           SizedBox(
                  //             width: 30,
                  //           ),
                  //           Expanded(
                  //               flex:2,
                  //               child: Image(
                  //                 image: AssetImage('images/image1.jpg'),
                  //                 width: 50,
                  //               )
                  //
                  //           ),
                  //           SizedBox(
                  //             width: 30,
                  //           ),
                  //           Expanded(
                  //               flex:4,
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text('Food Name = '+items[position].name),
                  //                   SizedBox(
                  //                       height: 10.0
                  //                   ),
                  //                   Text('Origin = '+items[position].origin),
                  //                 ],
                  //               )
                  //           ),
                  //         ],
                  //       );
                  //     }
                  // ),

                ]
            )
        )
    );
  }

}


