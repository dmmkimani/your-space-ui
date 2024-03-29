import 'package:project/tabs/account/widgets/textfield_email.dart';
import 'package:project/tabs/account/widgets/textfield_fname.dart';
import 'package:project/tabs/account/widgets/textfield_lname.dart';
import 'package:project/tabs/account/widgets/textfield_password.dart';

class InputHelpers {
  Map<String,String> getCreateAccountInputs() {
    return {
      'fName' : FNameInputState.fName.text.toString(),
      'lName' : LNameInputState.lName.text.toString(),
      'email' : EmailInputState.email.text.toString(),
      'password' : PasswordInputState.password.text.toString()
    };
  }

  Map<String,String> getLoginInputs() {
    return {
      'email' : EmailInputState.email.text.toString(),
      'password' : PasswordInputState.password.text.toString()
    };
  }

  void clearCreateAccountInputs() {
    FNameInputState.fName.clear();
    LNameInputState.lName.clear();
    clearInputs();
  }

  void clearInputs() {
    EmailInputState.email.clear();
    PasswordInputState.password.clear();
  }

  void disposeInputs() {
    EmailInputState.email.dispose();
    PasswordInputState.password.dispose();
  }
}