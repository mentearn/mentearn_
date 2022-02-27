import 'package:flutter/material.dart';
import 'package:untitled/screens/home_screen_mentie_screens/mentee_profile.dart';
import 'welcome_screen.dart';
import 'home_screen_mentie_screens/discover.dart';
import 'home_screen_mentie_screens/chat_mentie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;
final CollectionReference collectionUser =
    FirebaseFirestore.instance.collection('mentees');

class HomeScreenMentee extends StatefulWidget {
  static const String id = 'homeScreenMentee';

  @override
  _HomeScreenMenteeState createState() => _HomeScreenMenteeState();
}

class _HomeScreenMenteeState extends State<HomeScreenMentee> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('mentearn')),
      body: PageView(
        controller: pageController,
        children: [
          Container(color: Colors.greenAccent),
          DiscoverStream(),
          ChatScreenMentee(),
          MenteeProfile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.black,
        onTap: onTapped,
      ),
    );
  }
}
