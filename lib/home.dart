// ignore_for_file: prefer_final_fields, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_basics/pages/home.dart';
import 'package:flutter_basics/pages/message.dart';
import 'package:flutter_basics/pages/settings.dart';
import 'package:flutter_basics/pages/users.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [Home(), Message(), User(), Settings()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: appBarMethod(),
          bottomNavigationBar: bottomNav(),
          //body: _pages[_selectedIndex],
          body: ListTile(title: Text('List one and two and three four')),
          drawer: Drawer()),
    );
    //body: Text('body'));
    /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Presesed');
        },
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    //testing
  }

  AppBar appBarMethod() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 16, 149, 232),
      elevation: 0,
      title: Center(
        /*child: const Text(
              'Druk Shop',
              style: TextStyle(color: Colors.white),
            ),*/
        child: ListTile(
          title: Text('Testing',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Text(
            'sub-title',
            style: TextStyle(fontSize: 11),
          ),
        ),
      ),
      /*leading: Expanded(
            child: ListTile(
              title: Text('Testing'),
              subtitle: Text('sub-title'),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              print('Press Home');
            },
            icon: Icon(Icons.menu),
            color: Colors.white,
          ),*/
      automaticallyImplyLeading: true,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                print('Preseed');
              },
              icon: Icon(Icons.logout),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
              color: Colors.white,
            )
          ],
        ),
      ],
    );
  }

  BottomNavigationBar bottomNav() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _navigateBottomBar,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromARGB(255, 16, 149, 232),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: Colors.white,
            ),
            label: 'Messages'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'User'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            label: 'Settings')
      ],
    );
  }
}
