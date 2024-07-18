import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://localhost:3000/api';

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'email': email, 'password': password},
    );
    return json.decode(response.body);
  }

  static Future<Map<String, dynamic>> signUp(
      String email, String password, String name, String photo) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      body: {
        'email': email,
        'password': password,
        'name': name,
        'photo': photo
      },
    );
    return json.decode(response.body);
  }

  static Future<Map<String, dynamic>> resetPassword(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reset-password'),
      body: {'email': email},
    );
    return json.decode(response.body);
  }
}
