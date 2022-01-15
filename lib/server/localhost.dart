import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

class LocalHost {
  Future<Map<String,dynamic>> login(FirebaseAuth? auth, String email, String password) async {
    Map<String,dynamic> functionResponse = {'success' : false};

    Map<String,String> body = {'email': email, 'password': password};
    final credentials = json.encode(body);

    Response response =
        await post(Uri.parse(localhost() + "/login"), body: credentials);

    switch (response.statusCode) {
      case 200:
        String token = response.body.toString();
        functionResponse = {'success' : true, 'token' : token};
        return functionResponse;

      case 404:
        String errorMessage = response.body.toString();
        functionResponse = {'success' : false, 'message' : errorMessage};
        return functionResponse;
    }

    return functionResponse;
  }

  Future<String> getCapacity(String building, String room) async {
    Map<String, String> query = {'building': building, 'room': room};

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
