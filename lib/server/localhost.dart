import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class LocalHost {
  Future<Map<String, dynamic>> login(String email, String password) async {
    Map<String, dynamic> functionResponse = {'success': false};

    Map<String, String> body = {'email': email, 'password': password};
    final credentials = json.encode(body);

    Response response =
        await post(Uri.parse(localhost() + '/login'), body: credentials);

    switch (response.statusCode) {
      case 200:
        String token = response.body.toString();
        functionResponse = {'success': true, 'token': token};
        return functionResponse;

      case 404:
        String errorMessage = response.body.toString();
        functionResponse = {'success': false, 'message': errorMessage};
        return functionResponse;
    }

    return functionResponse;
  }

  Future<Map<String, dynamic>> createAccount(String email, String password) async {
    Map<String, dynamic> functionResponse = {'success': false};

    Map<String, String> body = {'email': email, 'password': password};
    final credentials = json.encode(body);

    Response response = await post(Uri.parse(localhost() + '/create_account'),
        body: credentials);

    switch (response.statusCode) {
      case 200:
        String token = response.body.toString();
        functionResponse = {'success': true, 'token': token};
        return functionResponse;

      case 404:
        String errorMessage = response.body.toString();
        functionResponse = {'success': false, 'message': errorMessage};
        return functionResponse;
    }

    return functionResponse;
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

  Future<Map<String, dynamic>> getBookings(
      String building, String room, String date) async {
    Map<String, String> query = {
      'building': building,
      'room': room,
      'date': date
    };

    final body = json.encode(query);

    Response response =
        await post(Uri.parse(localhost() + '/bookings'), body: body);

    Map<String, dynamic> bookings = json.decode(response.body);

    return bookings;
  }

  Future<Map<String, dynamic>> book(Map<String, dynamic> booking) async {
    Map<String, dynamic> functionResponse = {'success': false, 'message': 'An error has occurred!'};

    final body = json.encode(booking);

    Response response = await post(Uri.parse(localhost() + '/book'), body: body);

    switch (response.statusCode) {
      case 200:
        functionResponse = {'success': true, 'message': 'Booking successful!'};
        return functionResponse;

      case 403:
        String errorMessage = response.body.toString();
        functionResponse = {'success': false, 'message': errorMessage};
        return functionResponse;
    }

    return functionResponse;
  }

  String localhost() {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000';
    } else {
      return 'http://localhost:3000';
    }
  }
}
