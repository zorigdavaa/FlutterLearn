import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final String baseUrl = "https://api.blackcandy.io/v1";
final String tokenPrefKey = "auth_token";

Future<bool> login(String username, String password) async {
  final url = Uri.parse("$baseUrl/login");

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"username": username, "password": password}),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final token = data["token"]; // adjust key based on API response

    // Save token locally
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenPrefKey, token);

    print("Token saved: $token");
    return true;
  } else {
    print("Login failed: ${response.body}");
    return false;
  }
}

Future<void> FetchMyTimeTracks() async {
  final token = await getToken();
  final url = Uri.parse("$baseUrl/time-tracking");

  final response = await http.get(
    url,
    headers: {"Authorization": "Bearer $token"},
  );
  if (response.statusCode == 200) {
    print("Time Tracks: ${response.body}");
  } else {
    print("Error: ${response.statusCode}");
  }
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(tokenPrefKey);
}
