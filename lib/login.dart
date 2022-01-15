import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/first.dart';
import 'package:flutter_myapp/regis.dart';
import 'package:toast/toast.dart';

void main () => runApp(
  LoginPage()
);

class LoginPage extends StatefulWidget{
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{

  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void _loginSave() async{
    var msg = '';
    try{
      UserCredential userCredential = await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: _email, password: _password
      );
      msg = 'Login Success';
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyHome()));
    }catch(e){
      msg = 'Email and Password not match';
    }
    Toast.show(msg, context);
  }

  Widget _buildLogo(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage("images/image1.jpg"),
            radius: 60,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
        ),
        Text(
          'Indonesian Food App',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ), textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmail(){
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
        validator: (value){
          if(value!.isEmpty){
            return 'Enter Email';
          }
        },
        onSaved: (val) => setState(() => _email = val!)
      ),
    );
  }

  Widget _buildPassword(){
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        obscureText: true,
        keyboardType: TextInputType.text,
        onChanged: (value){

        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, color: Colors.amber,),
            labelText: 'Password',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.amberAccent)
            )
        ),
        validator: (value){
          if(value!.isEmpty){
            return 'Enter Password';
          }
        },
          onSaved: (val) => setState(() => _password = val!)
      ),
    );
  }

  Widget _buildLogin(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height/20),
          width: 5 * (MediaQuery.of(context).size.width/10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0 ,
            color: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            onPressed: (){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  _loginSave();

                }
            },
            child: Text(
              'Login',
              style: TextStyle(color:Colors.white,letterSpacing: 1.5, fontSize: MediaQuery.of(context).size.height/40),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRegister(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20,
          child: FlatButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => RegisPage()));
            },
            child: Text('Register Here',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
            )
          ),
        )
      ],
    );
  }

  Widget _buildContainer(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20)
          ),
          child: Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 20
                      ),
                      _buildEmail(),
                      _buildPassword(),
                      SizedBox(
                          height: 30
                      ),
                      _buildLogin()
                    ],
                  ),
                ),
                _buildRegister()
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.amber,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height:MediaQuery.of(context).size.height*0.8,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(70),
                      bottomRight: const Radius.circular(70),
                    )
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildContainer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
