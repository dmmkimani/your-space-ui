import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

class LocalHost {
  Future<Map<String, dynamic>> createAccount(
      Map<String, dynamic> accountInfo) async {
    Response response = await post(Uri.parse(localhost() + '/create_account'),
        body: json.encode(accountInfo));

    switch (response.statusCode) {
      case 200:
        return {
          'success': true,
          'token': json.decode(response.body.toString())
        };

      case 403:
        return {
          'success': false,
          'message': json.decode(response.body.toString())
        };

      default:
        return {'success': false, 'message': 'An error occurred!'};
    }
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> loginInfo) async {
    Response response = await post(Uri.parse(localhost() + '/login'),
        body: json.encode(loginInfo));

    switch (response.statusCode) {
      case 200:
        return {
          'success': true,
          'token': json.decode(response.body.toString())
        };

      case 403:
        return {
          'success': false,
          'message': json.decode(response.body.toString())
        };

      default:
        return {'success': false, 'message': 'An error occurred!'};
    }
  }

  Future<String> getBuildingName(String building) async {
    Response response = await post(Uri.parse(localhost() + '/building_name'),
        body: json.encode(building));

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> getRoomDetails(Map<String, dynamic> room) async {
    Response response = await post(Uri.parse(localhost() + '/room_details'),
        body: json.encode(room));

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> getRoomBookings(
      Map<String, dynamic> room) async {
    Response response = await post(Uri.parse(localhost() + '/room_bookings'),
        body: json.encode(room));

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> getUserBookings(String userEmail) async {
    final body = json.encode({'userEmail': userEmail});

    Response response =
        await post(Uri.parse(localhost() + '/user_bookings'), body: body);

    switch (response.statusCode) {
      case 200:
        return {'success': true, 'response': json.decode(response.body)};

      case 404:
        return {
          'success': false,
          'response': json.decode(response.body.toString())
        };

      default:
        return {'success': false, 'response': 'An error occurred!'};
    }
  }

  Future<Map<String, dynamic>> book(Map<String, dynamic> bookingDetails) async {
    Response response = await post(Uri.parse(localhost() + '/book'),
        body: json.encode(bookingDetails));

    switch (response.statusCode) {
      case 200:
        return {
          'success': true,
          'message': json.decode(response.body.toString())
        };

      case 403:
        return {
          'success': false,
          'message': json.decode(response.body.toString())
        };

      default:
        return {'success': false, 'message': 'An error occurred!'};
    }
  }

  Future<Map<String, dynamic>> amendBooking(
      Map<String, dynamic> bookingDetails) async {
    Response response = await post(Uri.parse(localhost() + '/amend'),
        body: json.encode(bookingDetails));

    switch (response.statusCode) {
      case 200:
        return {
          'success': true,
          'message': json.decode(response.body.toString())
        };

      case 403:
        return {
          'success': false,
          'message': json.decode(response.body.toString())
        };

      default:
        return {'success': false, 'message': 'An error occurred!'};
    }
  }

  Future<void> deleteFromHistory(Map<String, dynamic> bookingDetails) async {
    await post(Uri.parse(localhost() + '/delete'),
        body: json.encode(bookingDetails));
  }

  String localhost() {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000';
    } else {
      return 'http://localhost:3000';
    }
  }
}
