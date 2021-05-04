import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;

  Future signup(String email, String password) async {
    try {
      AuthResult signup = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _user = signup.user;
      print(_user.uid);
      return _user;
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signin(String email, String password) async {
    try {
      AuthResult login = await _auth.signInWithEmailAndPassword(email: email, password: password);
      _user = login.user;
      print(_user.uid);
      return _user;

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    await _auth.signOut();
  }

  Future storeUser(String fname, String lname) async{
      await Firestore.instance.collection("users").document(_user.uid).setData({
        "fname":fname,
        "lname":lname,
        "email":_user.email,
        "uid": _user.uid
      });
  }
  
  Stream<FirebaseUser> get stat {
    return _auth.onAuthStateChanged;
  }


}