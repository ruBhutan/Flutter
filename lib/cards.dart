// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.only(top: 20),
            child: Image.asset(
              'images/cru.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.only(top: 20),
            child: Image.asset(
              'images/exp.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.only(top: 20),
            child: Image.asset(
              'images/gold.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.only(top: 20),
            child: Image.asset(
              'images/redballons.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.only(top: 20),
            child: Image.asset(
              'images/sit.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
