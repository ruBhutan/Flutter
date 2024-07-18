// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            'User Registration',
            style: TextStyle(fontSize: 35),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                name = value;
              });
              print('name is $name');
            },
            decoration: InputDecoration(
                labelText: 'Name',
                //hintText: 'name',
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                email = value;
              });
              print('email is $email');
            },
            decoration: InputDecoration(
                labelText: 'Email',
                //hintText: 'email',
                prefixIcon: Icon(Icons.email)),
          ),
        ],
      ),
    ));
  }
}
