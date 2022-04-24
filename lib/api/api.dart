import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sport_booking/api/token.dart';
import 'package:sport_booking/models/booking.dart';
import 'package:sport_booking/models/bookingdetail.dart';
import 'package:sport_booking/models/feedback.dart';
import 'package:sport_booking/models/find_opponent.dart';
import 'package:sport_booking/models/profile.dart';
import 'package:sport_booking/models/slider.dart';
import 'package:sport_booking/models/slot.dart';
import 'package:sport_booking/models/sport_type.dart';
import 'package:sport_booking/models/sport_venue.dart';

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

  //Get List Slider
  Future<List<DataSlider>> getListSlider() async {
    String? token = await TokenService().getToken();

    final response =
        await http.get(Uri.parse("$baseUrl/image-sliders"), headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> pr = map['data'];
      // ignore: avoid_print
      // print('list: ' + pr.toString());

      return pr.map((json) => DataSlider.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Update Password
  Future updatePassword(String password) async {
    String? token = await TokenService().getToken();

    Map data = {'password': password};
    try {
      final response = await http.post(Uri.parse("$baseUrl/update_password"),
          body: data,
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          });
      print(response.body);
      return json.decode(response.body);
    } catch (e) {
      print(e);
    }
  }

  //Update Password
  Future sendFeedback(String title, String content) async {
    String? token = await TokenService().getToken();

    Map data = {'title': title, 'content': content};
    try {
      final response = await http.post(Uri.parse("$baseUrl/feedback"),
          body: data,
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          });
      print(response.body);
      return json.decode(response.body);
    } catch (e) {
      print(e);
    }
  }

  //Get List Sport
  Future<List<SportType>> getSportType() async {
    final response = await http.get(Uri.parse("$baseUrl/sport_types"));

    if (response.statusCode == 200) {
      // print(response.body);
      List<dynamic> map = json.decode(response.body);

      return map.map((json) => SportType.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Check Availability
  Future<List<DataSlot>> checkAvailability(
      String venue, String sport, String date) async {
    String? token = await TokenService().getToken();

    Map data = {'venue_id': venue, 'sport_id': sport, 'date': date};

    final response = await http.post(Uri.parse("$baseUrl/slot-availability"),
        body: data,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> map = json.decode(response.body)['data'];

      return map.map((json) => DataSlot.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Check Availability
  Future<List<DataBookingStatus>> createBooking(
      String total,
      String slotId,
      String venueId,
      String isDeposit,
      String isFull,
      String slotAvailabilityId,
      bool isNoOpponent,
      String teamName) async {
    String? token = await TokenService().getToken();

    Map data = {
      'booking no': '#32132232',
      'total_amount': total,
      'venue_id': venueId,
      'slot_id': slotId,
      'slot_availability_id': slotAvailabilityId,
      'is_deposit': isDeposit,
      'is_full': isFull,
      'is_no_opponent': isNoOpponent == true ? '1' : '0',
      'team_name': teamName
    };

    final response = await http.post(Uri.parse("$baseUrl/booking"),
        body: data,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> map = json.decode(response.body)['data'];

      return map.map((json) => DataBookingStatus.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Get UpcomingBooking
  static Future<List<DataBookingDetail>> getUpcomingBooking() async {
    String? token = await TokenService().getToken();

    final response =
        await http.get(Uri.parse("$baseUrl/upcoming-booking"), headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> ub = map['data'];
      // ignore: avoid_print
      print('list: ' + ub.toString());

      return ub.map((json) => DataBookingDetail.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Get PastBooking
  static Future<List<DataBookingDetail>> getPastBooking() async {
    String? token = await TokenService().getToken();

    final response =
        await http.get(Uri.parse("$baseUrl/past-booking"), headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> pb = map['data'];
      // ignore: avoid_print
      print('list: ' + pb.toString());

      return pb.map((json) => DataBookingDetail.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Get Opponent List
  Future<List<DataOpponent>> getOpponentList() async {
    String? token = await TokenService().getToken();

    final response =
        await http.get(Uri.parse("$baseUrl/find-opponent"), headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> ub = map['data'];
      // ignore: avoid_print
      print('list opponent: ' + ub.toString());

      return ub.map((json) => DataOpponent.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //Post Opponent
  Future<bool> postOpponent(
    String id,
    String opponent,
  ) async {
    String? token = await TokenService().getToken();

    final response = await http.post(Uri.parse("$baseUrl/post_opponent"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: {
          "booking_id": id,
          "opponent_team_name": opponent
        });

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else if (response.statusCode == 401) {
      throw Exception('Auth Failed');
    } else {
      throw response.body;
    }
  }
}
