import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class LocalHost {

  Future<String> getCapacity(String building, String room) async {

    Map<String, String> query = {
      'building' : building,
      'room' : room
    };

    final body = json.encode(query);

    Response response =
      await post(Uri.parse(localhost() + '/capacity'), body: body);

    String capacity = response.body.toString();

    return capacity;
  }

  String localhost() {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000';
    } else {
      return 'http://localhost:3000';
    }
  }
}