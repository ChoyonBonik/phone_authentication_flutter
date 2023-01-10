import 'package:flutter/material.dart';

class People extends StatelessWidget {
  const People({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('people Page', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)
      ],
    );
  }
}
