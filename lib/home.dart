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
  final pages = [Page1(), Page2(), Page3()];
  var _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              child: Column(
                children: [
                  Material(
                      borderRadius: BorderRadius.all(Radius.circular(150.0)),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image.asset(
                          'images/drawer_header.jpg',
                          width: 80,
                          height: 80,
                        ),
                      ))
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Page1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Page2'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Page3'),
          ),
        ],
      )
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(onPressed: (){}, child: Text("Page1"),),
          //     ElevatedButton(onPressed: (){}, child: Text("Page2"),),
          //     ElevatedButton(onPressed: (){}, child: Text("Page3"),),
          //   ],
          // ),
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
        //color: Colors.white,
        buttonBackgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        height: 50,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 900),
      ),
    );
  }
}
