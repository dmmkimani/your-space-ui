import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class LocalHost {
  Future<Map<String, dynamic>> createAccount(
      String fName, String lName, String email, String password) async {
    Map<String, String> params = {
      'fName': fName,
      'lName': lName,
      'email': email,
      'password': password
    };
    final body = json.encode(params);

    Response response =
        await post(Uri.parse(localhost() + '/create_account'), body: body);

    switch (response.statusCode) {
      case 200:
        return {'success': true, 'token': json.decode(response.body.toString())};

      case 403:
        return {'success': false, 'message': json.decode(response.body.toString())};

      default:
        return {'success': false, 'message': 'An error occurred!'};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    Map<String, String> params = {'email': email, 'password': password};
    final body = json.encode(params);

    Response response =
        await post(Uri.parse(localhost() + '/login'), body: body);

    switch (response.statusCode) {
      case 200:
        return {'success': true, 'token': json.decode(response.body.toString())};

      case 403:
        return {'success': false, 'message': json.decode(response.body.toString())};

      default:
        return {'success': false, 'message': 'An error occurred!'};
    }
  }

  Future<Map<String, dynamic>> getRoomDetails(
      String building, String room) async {
    Map<String, String> query = {'building': building, 'room': room};

    final body = json.encode(query);

    Response response =
        await post(Uri.parse(localhost() + '/room_details'), body: body);

    Map<String, dynamic> details = json.decode(response.body);

    return details;
  }

  Future<Map<String, dynamic>> getRoomBookings(
      String building, String room, String date) async {
    Map<String, String> query = {
      'building': building,
      'room': room,
      'date': date
    };

    final body = json.encode(query);

    Response response =
        await post(Uri.parse(localhost() + '/room_bookings'), body: body);

    Map<String, dynamic> bookings = json.decode(response.body);

    return bookings;
  }

  Future<Map<String, dynamic>> getUserBookings(String userEmail) async {
    Map<String, String> query = {'userEmail': userEmail};

    final body = json.encode(query);

    Response response =
        await post(Uri.parse(localhost() + '/user_bookings'), body: body);

    switch (response.statusCode) {
      case 200:
        return {'success': true, 'response': json.decode(response.body)};

      case 404:
        return {'success': false, 'response': json.decode(response.body.toString())};

      default:
        return {'success': false, 'response': 'An error occurred!'};
    }
  }

  Future<Map<String, dynamic>> book(Map<String, dynamic> booking) async {
    Response response = await post(Uri.parse(localhost() + '/book'),
        body: json.encode(booking));

    switch (response.statusCode) {
      case 200:
        return {'success': true, 'message': json.decode(response.body.toString())};

      case 403:
        return {'success': false, 'message': json.decode(response.body.toString())};

      default:
        return {'success': false, 'message': 'An error occurred!'};
    }
  }

  String localhost() {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000';
    } else {
      return 'http://localhost:3000';
    }
  }
}
