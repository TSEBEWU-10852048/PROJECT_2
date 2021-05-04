import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'services.dart';
import 'login.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Success",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("You are logged in", style: TextStyle(fontSize: 30)),
              SizedBox(height:20),
              RaisedButton(child: Text("Log Out", style: TextStyle(color: Colors.white)), color: Colors.blue, onPressed: () async{
                  await _auth.signOut();
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>Login()));
              },),
            ]
          ),
        ),
      ),
    );
  }
}
