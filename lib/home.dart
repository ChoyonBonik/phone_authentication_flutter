import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_practice/pages/page1.dart';
import 'package:otp_practice/pages/page2.dart';
import 'package:otp_practice/pages/page3.dart';

import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = "";
  final pages = [
    Page1(), Page2(), Page3()
  ];
  var _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Home'),
            IconButton(
              icon: Icon(Icons.logout, color: Colors.red),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body:
      // Center(
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(
      //           "Abedok",
      //           style: TextStyle(
      //             color: Colors.indigo[900],
      //             fontSize: 50,
      //           ),
      //         ),
      //
      //       ],
      //     ),
      //   ),
      // ),
      pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.person),
          Icon(Icons.alarm),
          Icon(Icons.notifications),
        ],
        index: 0,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        //height: 70,
        backgroundColor: Colors.blue,
        animationDuration: const Duration(milliseconds: 900),
      ),
    );
  }
}
