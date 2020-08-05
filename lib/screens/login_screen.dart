import 'package:EP_chat/screens/chat_screen.dart';
import 'package:EP_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:EP_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance ;
  bool showSpinner = false ;
  String email ;
  String password ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: ModalProgressHUD(
          inAsyncCall: showSpinner ,
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                    child: Hero(
                    tag: 'logo',
                    child: Container(
                    height: 100.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value ;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 24.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = email ;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 13.0,horizontal: 30.0),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner = true ;
                      });
                      try{
                        final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(user != null){
                          Navigator.pushNamed(context, ChatScreen.id); 
                        }
                        setState(() {
                          showSpinner = false ;
                        });
                      }catch(e){
                        print("Error Sorry");
                        setState(() {
                          showSpinner = false ;
                        });
                      }
                    },
                    minWidth: 50.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.0,horizontal: 30.0),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(onPressed: () {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                  minWidth: 50.0,
                  height: 42.0,
                  child: Text(
                    'Go Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
