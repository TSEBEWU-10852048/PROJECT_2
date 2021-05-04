import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/pages/home.dart';
import 'package:project2/pages/services.dart';
import 'package:project2/pages/signup.dart';
import 'loading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
final AuthService _auth = new AuthService();
final email = new TextEditingController();
final password = new TextEditingController();

bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : SafeArea(
          child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LOG IN",
                      style: TextStyle(color: Colors.blue, fontSize: 40),
                    ),
                    SizedBox(height: 25),
                    Form(
                        child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),

                            //Password
                            TextFormField(
                              controller:  password,
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
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 2), //Forgot password
                            Align(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Text("Forgot password",
                                      style: TextStyle(color: Colors.blue)),
                                )),

                            //Sign In button
                            GestureDetector(
                              onTap: () async{
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic res = await _auth.signin(email.text, password.text);
                                  if(res != null) {
                                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>Home()));
                                  } else {
                                    setState(() {
                                      loading = false;
                                    });
                              }
                              },
                                                        child: Container(
                                width: double.infinity,
                                height: 50,
                                child: Center(
                                  child: Text("SIGN IN",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),

                            //Link to sign in
                            FlatButton(
                              child: Text(
                                "Don't have an account? Sign up",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                            ),
                          ]),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
