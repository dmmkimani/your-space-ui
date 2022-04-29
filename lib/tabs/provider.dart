import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static FirebaseAuth? currentAuth;
  static User? currentUser;

  FirebaseAuth get auth {
    return currentAuth!;
  }

  User? get user {
    return currentUser;
  }

  set auth(FirebaseAuth auth) {
    currentAuth = auth;
  }

  set user(User? user) {
    currentUser = user;
  }
}
