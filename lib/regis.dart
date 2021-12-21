import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/login.dart';
import 'package:toast/toast.dart';

void main() async{
  runApp(RegisPage());
}

class RegisPage extends StatefulWidget{
  _RegisPage createState() => _RegisPage();
}

class _RegisPage extends State<RegisPage> {

  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void _regisSave() async {
    var msg = '';
    try{
      UserCredential userCredential = await FirebaseAuth.instance.
      createUserWithEmailAndPassword(email: _email, password: _password
      );
      msg = 'Register Success';
    }catch(e){
      msg = 'Register Fail';
    }
    Toast.show(msg, context);
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (BuildContext context) => LoginPage()));
  }

  Widget _buildSave() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
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
                _regisSave();
              }
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Colors.white, letterSpacing: 1.5, fontSize: MediaQuery
                  .of(context)
                  .size
                  .height / 40),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email, color: Colors.amber,),
              labelText: 'Email',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.amberAccent)
              )
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Email';
            }
          },
          onSaved: (val) => setState(() => _email = val!)
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
          obscureText: true,
          keyboardType: TextInputType.text,
          onChanged: (value) {

          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: Colors.amber,),
              labelText: 'Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.amberAccent)
              )
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Password';
            }
          },
          onSaved: (val) => setState(() => _password = val!)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Create a new Account'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildEmail(),
              SizedBox(
                height: 15.0,
              ),
              _buildPassword(),
              SizedBox(
                height: 15.0,
              ),
              _buildSave()
            ],
          ),
        ),
      ),
    );
  }
}