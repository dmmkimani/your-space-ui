import 'package:project/server/localhost.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GlobalData {
  static LocalHost server = LocalHost();
  static FirebaseAuth? auth;
  static User? currentUser;
}
