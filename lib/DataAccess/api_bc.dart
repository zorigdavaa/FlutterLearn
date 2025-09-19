import 'dart:convert';
import 'package:flutter_app/Model/timetrack.dart';
import 'package:flutter_app/views/pages/time_tracks_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final String baseUrl = "https://api.blackcandy.io/v1";
final String tokenPrefKey = "auth_token";

Future<bool> login(String email, String password) async {
  final url = Uri.parse("$baseUrl/login");

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/x-www-form-urlencoded"},
    body: {"Email": email, "Password": password},
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

Future<List<TimeTrack>> fetchMyTimeTracks() async {
  final token = await getToken();
  final url = Uri.parse("$baseUrl/time-tracking");

  final response = await http.get(
    url,
    headers: {"Authorization": "Bearer $token"},
  );
  print("fetch my track: ${response.statusCode}");
  if (response.statusCode == 200) {
    print("Time Tracks: ${response.body}");
    var data = jsonDecode(response.body);
    List<dynamic> tracksJson = data["time_trackings"];
    List<TimeTrack> timeTracks = tracksJson
        .map((x) => TimeTrack.fromJson(x))
        .toList();

    return timeTracks;
  } else {}
  return <TimeTrack>[];
}

Future<bool> startMyTimeTracks() async {
  final token = await getToken();
  final url = Uri.parse("$baseUrl/time-tracking/clockin");

  final response = await http.post(
    url,
    headers: {"Authorization": "Bearer $token"},
  );
  print("start my track: ${response.statusCode}");
  if (response.statusCode == 200) {
    return true;
  } else {
    print("start my track: ${response.body}");
  }
  return false;
}

Future<bool> endMyTimeTracks() async {
  final token = await getToken();
  final url = Uri.parse("$baseUrl/time-tracking/clockout");

  final response = await http.post(
    url,
    headers: {"Authorization": "Bearer $token"},
  );
  print("start my track: ${response.statusCode}");
  if (response.statusCode == 200) {
    return true;
  }
  return false;
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(tokenPrefKey);
}
