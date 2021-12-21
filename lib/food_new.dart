import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() => runApp(MaterialApp(
    home: FoodNew()
));

class FoodNew extends StatefulWidget{
  _FoodNew createState() => _FoodNew();
}

class _FoodNew extends State<FoodNew>{

  final _formKey = GlobalKey<FormState>();
  late String _foodName, _originFood;

  final notesReference = FirebaseDatabase.instance.reference().child('food');
  final nameHolder = TextEditingController();
  final originHolder = TextEditingController();

  void _addFood(){
    var pesan = '';
    try{
      notesReference.push().set({
        'food_name': _foodName,
        'origin_food': _originFood
      });
      pesan ='Add Record Success';
      nameHolder.clear();
      originHolder.clear();
    }catch(e){
      pesan = 'Add Record Failed';
    }
    Toast.show(pesan,context);
  }

  Widget Header(){
    return Container(
      child: Text('Add New Record', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    );
  }

  Widget FoodName(){
    return Container(
      child: TextFormField(
        controller: nameHolder,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'Food Name',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.amberAccent)
            )
        ),
        validator: (value){
          if(value!.isEmpty){
            return 'Enter Food Name';
          }
        },
        onSaved: (val) => setState(() => _foodName = val!)
    ),
    );
  }

  Widget FoodOrigin(){
    return Container(
      child: TextFormField(
          controller: originHolder,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: 'Origin Food',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.amberAccent)
              )
          ),
          validator: (value){
            if(value!.isEmpty){
              return 'Enter Origin Food';
            }
          },
          onSaved: (val) => setState(() => _originFood = val!)
      ),
    );
  }

  Widget ButtonSave(){
    return Container(
      height: 1.4 * (MediaQuery
          .of(context)
          .size
          .height / 20),
      width: 5 * (MediaQuery
          .of(context)
          .size
          .width / 10),
      margin: EdgeInsets.only(bottom: 20),
      child: RaisedButton(
        elevation: 5.0,
        color: Colors.amber,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            _addFood();
          }
        },
        child: Text(
          'Save Record',
          style: TextStyle(
              color: Colors.white, letterSpacing: 1.5, fontSize: MediaQuery
              .of(context)
              .size
              .height / 40),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Add New Fav Food')
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 10,
              ),
              FoodName(),
              SizedBox(
                height: 10,
              ),
              FoodOrigin(),
              SizedBox(
                height: 10,
              ),
              ButtonSave(),
            ],
          ),
        )
      )
    );

  }

}