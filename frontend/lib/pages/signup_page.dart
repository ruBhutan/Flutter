import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_page.dart';
import '../services/auth_service.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _photoController = TextEditingController();

  void _signUp(BuildContext context) async {
    var name = _nameController.text;
    var email = _emailController.text;
    var password = _passwordController.text;
    var photo = _photoController.text;

    var response = await AuthService.signUp(email, password, name, photo);

    if (response['status'] == 'success') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response['token']);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign Up failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextField(
                controller: _photoController,
                decoration: InputDecoration(labelText: 'Photo URL'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _signUp(context),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
