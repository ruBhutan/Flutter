import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/profile_service.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> user = {};

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await ProfileService.fetchProfile(token!);

    if (response['status'] == 'success') {
      setState(() {
        user = response['data'];
      });
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(title: Text('Apply Leave'), onTap: () {}),
            // Write your code here for drawer item onTap

            ListTile(
              title: Text('Check Balances'),
              onTap: () {
                // Write your code here for drawer item onTap
              },
            ),
            // Add more ListTile widgets for additional items
          ],
        ),
      ),
      body: user.isEmpty
          ? SingleChildScrollView(
              child: Center(child: CircularProgressIndicator()))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    user['photo'],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '${user['name']}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: 'Tab 1'),
                          Tab(text: 'Tab 2'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Center(child: Text('Tab 1 content')),
                            Center(child: Text('Tab 2 content')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          if (index == 0) {
            // Handle home navigation
          } else if (index == 1) {
            // Handle profile navigation
          }
        },
      ),
    );
  }
}
