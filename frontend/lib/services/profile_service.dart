import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileService {
  static const String baseUrl = 'http://localhost:3000/api';

  static Future<Map<String, dynamic>> fetchProfile(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/profile'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return json.decode(response.body);
  }
}
