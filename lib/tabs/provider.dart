import 'package:project/server/server.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GlobalData {
  static FirebaseAuth? auth;
  static User? currentUser;
}
