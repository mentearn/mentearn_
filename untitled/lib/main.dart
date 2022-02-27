import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/screens/whitescreen.dart';
import 'package:untitled/screens/black_screen.dart';
import 'package:untitled/screens/welcome_screen.dart';
import 'package:untitled/screens/registration_screen_for_mentor.dart';
import 'package:untitled/screens/registration_screen_for_mentee.dart';
import 'package:untitled/screens/login_screen.dart';
import 'package:untitled/screens/mentee_cover_letter_screen.dart';
import 'package:untitled/screens/mentor_cover_letter_screen.dart';
import 'package:untitled/screens/home_screen_mentee.dart';
import 'package:untitled/screens/mentee_info.dart';
import 'package:untitled/screens/mentor_info.dart';
import 'package:untitled/screens/home_screen_mentie_screens/apply.dart';
import 'package:untitled/screens/home_screen_mentor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Mentearn());
}

class Mentearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreenMentor.id: (context) => RegistrationScreenMentor(),
        RegistrationScreenMentee.id: (context) => RegistrationScreenMentee(),
        LoginScreen.id: (context) => LoginScreen(),
        WhiteScreen.id: (context) => WhiteScreen(),
        BlackScreen.id: (context) => BlackScreen(),
        MenteeCover.id: (context) => MenteeCover(),
        MentorCover.id: (context) => MentorCover(),
        HomeScreenMentee.id: (context) => HomeScreenMentee(),
        HomeScreenMentor.id: (context) => HomeScreenMentor(),
        MenteeInfo.id: (context) => MenteeInfo(),
        MentorInfo.id: (context) => MentorInfo(),
        Apply.id: (context) => Apply(),

        //ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
