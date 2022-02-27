import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/components/RectangleButton.dart';
import 'package:untitled/screens/home_screen_mentor.dart';
//import 'package:untitled/screens/black_screen.dart';
import 'whitescreen.dart';
//import 'black_screen.dart';
import 'package:untitled/screens/home_screen_mentee.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  //final _googleSignIn = GoogleSignIn();
  String email = '';
  String password = '';

  /*Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }*/

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("User is not found, please try again"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.backpack,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Login Page",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              " E-mail",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
                //Do something with the user input.
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              " Password",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, HomeScreenMentee.id);
                        }
                      } catch (e) {
                        Future.delayed(Duration.zero, () => showAlert(context));
                        //Navigator.pushNamed(context, BlackScreen.id);
                        print(e);
                      }
                    },
                    child: ClipRRect(
                      child: Image.asset(
                        'images/Sign_up2.png',
                        height: 40.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, HomeScreenMentor.id);
                        }
                      } catch (e) {
                        Future.delayed(Duration.zero, () => showAlert(context));
                        //Navigator.pushNamed(context, BlackScreen.id);
                        print(e);
                      }
                    },
                    child: ClipRRect(
                      child: Image.asset(
                        'images/Sign_up2.png',
                        height: 40.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'as a Mentee',
                  style: TextStyle(fontFamily: "Poppins"),
                ),
                SizedBox(
                  width: 90,
                ),
                Text(
                  'as a Mentor',
                  style: TextStyle(fontFamily: "Poppins"),
                )
              ],
            ),
            /*Center(
              child: Text(
                "Or register with...",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Flexible(
              child: RoundedRectangleButton(
                title: 'Google',
                color: Colors.white,
                textColor: Colors.black,
                onPressed: () async {
                  /*try {
                    final user = await signInWithGoogle();
                    if (user != null) {
                      Navigator.pushNamed(context, WhiteScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }*/
                },
              ),
            ),
            Flexible(
              child: RoundedRectangleButton(
                title: 'Facebook',
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () async {
                  /*try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, WhiteScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }*/
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
