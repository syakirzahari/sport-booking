import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sport_booking/api/token.dart';
import 'package:sport_booking/models/feedback.dart';
import 'package:sport_booking/models/profile.dart';
import 'package:sport_booking/models/sportVenue.dart';

class ApiService {
  static String baseUrl = "http://128.199.198.193/api";

  //Get List Venues
  static Future<List<DataSport>> getListVenues() async {
    String? token = await TokenService().getToken();

    final response = await http.get(Uri.parse("$baseUrl/venues"), headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> pr = map['data'];
      // ignore: avoid_print
      print('list: ' + pr.toString());

      return pr.map((json) => DataSport.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

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
      // ignore: avoid_print
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
      // ignore: avoid_print
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
      // ignore: avoid_print
      print('list: ' + pr.toString());

      return pr.map((json) => DataSport.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Get UserData
  Future<DataProfile> getUserProfile() async {
    String? token = await TokenService().getToken();

    final response = await http.get(Uri.parse("$baseUrl/users"), headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> map = json.decode(response.body)['data'];
      // ignore: avoid_print

      return DataProfile.fromJson(map);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Get About Us
  Future<DataFeedback> getAboutUs() async {
    final response = await http.get(Uri.parse("$baseUrl/about-us"), headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> map = json.decode(response.body)['data'];

      return DataFeedback.fromJson(map);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Get Privacy
  Future<DataFeedback> getPrivacyPolicy() async {
    final response =
        await http.get(Uri.parse("$baseUrl/privacy-policy"), headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> map = json.decode(response.body)['data'];

      return DataFeedback.fromJson(map);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
