import 'package:firebase_database/firebase_database.dart';

class Food{
  late String _id;
  late String _name;
  late String _origin;

  Food(this._id, this._name, this._origin);

  Food.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['food_name'];
    this._origin = obj['origin_food'];
  }

  String get id => _id;
  String get name => _name;
  String get origin => _origin;

  Food.fromSnapshot(DataSnapshot snapshot)
  {
    _id = snapshot.key;
    _name = snapshot.value['food_name'];
    _origin = snapshot.value['origin_food'];
  }
}

class Drink{
  late String _id;
  late String _name;
  late String _origin;

  Drink(this._id, this._name, this._origin);

  Drink.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['drink_name'];
    this._origin = obj['origin_drink'];
  }

  String get id => _id;
  String get name => _name;
  String get origin => _origin;

  Drink.fromSnapshot(DataSnapshot snapshot)
  {
    _id = snapshot.key;
    _name = snapshot.value['drink_name'];
    _origin = snapshot.value['origin_drink'];
  }
}