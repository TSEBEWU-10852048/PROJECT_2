import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/pages/home.dart';
import 'login.dart';
import 'services.dart';
import 'loading.dart';
import 'dart:async';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = new AuthService();
  bool isLoading = false;

  //Controllers
  final fname = new TextEditingController();
  final lname = new TextEditingController();
  final email = new TextEditingController();
  final password1 = new TextEditingController();
  final password2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return isLoading? Loading() : SafeArea(
          child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text("SIGN UP", style: TextStyle(color: Colors.blue, fontSize: 40),),
                    SizedBox(height:25),

                    Form(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(controller: fname,
                                  decoration: InputDecoration(
                                    labelText: "First Name",
                                    labelStyle: TextStyle(color: Colors.blue),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),),
                                  ),
                                ),
SizedBox(height: 20),

                                //Last Name
                                TextFormField(
                                  controller: lname,
                                  decoration: InputDecoration(
                                    labelText: "Last Name",
                                    labelStyle: TextStyle(color: Colors.blue),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),),
                                  ),
                                ),
SizedBox(height: 20),

                                //Email
                                TextFormField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: TextStyle(color: Colors.blue),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),),
                                  ),
                                ),
SizedBox(height: 20),

                                //Password
                                TextFormField(
                                  controller: password1,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(color: Colors.blue),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),),
                                  ),
                                ),
SizedBox(height: 20),


                                //Confirm Password
                                TextFormField(
                                  controller: password2,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: "Confirm Password",
                                    labelStyle: TextStyle(color: Colors.blue),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),),
                                  ),
                                ),
SizedBox(height: 20),

                                //Sign Up button
                                GestureDetector(
                                  onTap: () async {
                                    if(password1.text == password2.text) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      dynamic res = await _auth.signup(email.text, password1.text);
                                      if(res != null) {
                                        _auth.storeUser(fname.text, lname.text);
                                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>Home()));
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    }

                                  },
                                    child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    child: Center(
                                      child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 20)),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
SizedBox(height: 20),

                                //Link to sign in
                                FlatButton(
                                  child: Text("Already have an account? Sign In", style: TextStyle(color: Colors.blue),),
                                  onPressed: (){
                                    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => Login(),),);
                                  },
                                ),
                              ]
                            ),
                          ) 
                          )
              ],),
                        ),
                      ),
            ),
          ),
      ),
    );
  }
}