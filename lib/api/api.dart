import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sport_booking/api/token.dart';
import 'package:sport_booking/models/sportVenue.dart';

class ApiService {
  static String baseUrl = "http://128.199.198.193/api";

  //Get List Venues
  static Future<List<DataSport>> getListFootballVenues() async {
    String? token = await TokenService().getToken();

    final response =
        await http.get(Uri.parse("$baseUrl/football-venues"), headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> pr = map['data'];
      print('list: ' + pr.toString());

      return pr.map((json) => DataSport.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Get List Futsal
  static Future<List<DataSport>> getListFutsalVenues() async {
    String? token = await TokenService().getToken();

    final response =
        await http.get(Uri.parse("$baseUrl/futsal-venues"), headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> pr = map['data'];
      print('list: ' + pr.toString());

      return pr.map((json) => DataSport.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Get List Futsal
  static Future<List<DataSport>> getListBadmintonVenues() async {
    String? token = await TokenService().getToken();

    final response =
        await http.get(Uri.parse("$baseUrl/badminton-venues"), headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> pr = map['data'];
      print('list: ' + pr.toString());

      return pr.map((json) => DataSport.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
