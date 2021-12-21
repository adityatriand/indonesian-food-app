import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() => runApp(MaterialApp(
    home: DrinkNew()
));

class DrinkNew extends StatefulWidget{
  _DrinkNew createState() => _DrinkNew();
}

class _DrinkNew extends State<DrinkNew>{

  final _formKey = GlobalKey<FormState>();
  late String _drinkName, _originDrink;

  final notesReference = FirebaseDatabase.instance.reference().child('drink');
  final nameHolder = TextEditingController();
  final originHolder = TextEditingController();

  void _addDrink(){
    var pesan = '';
    try{
      notesReference.push().set({
        'drink_name': _drinkName,
        'origin_drink': _originDrink
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

  Widget DrinkName(){
    return Container(
      child: TextFormField(
          controller: nameHolder,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: 'Drink Name',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.amberAccent)
              )
          ),
          validator: (value){
            if(value!.isEmpty){
              return 'Enter Drink Name';
            }
          },
          onSaved: (val) => setState(() => _drinkName = val!)
      ),
    );
  }

  Widget DrinkOrigin(){
    return Container(
      child: TextFormField(
          controller: originHolder,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: 'Origin Drink',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.amberAccent)
              )
          ),
          validator: (value){
            if(value!.isEmpty){
              return 'Enter Origin Drink';
            }
          },
          onSaved: (val) => setState(() => _originDrink = val!)
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
            _addDrink();
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
            title: Text('Add New Fav Drink')
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
                  DrinkName(),
                  SizedBox(
                    height: 10,
                  ),
                  DrinkOrigin(),
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