import 'package:project/screens/login/widgets/widget_email_input.dart';
import 'package:project/screens/login/widgets/widget_password_input.dart';

class InputFunctions {

  Map<String,String> getInputs() {
    return {
      'email' : EmailInputWidgetState.email.text.toString(),
      'password' : PasswordInputWidgetState.password.text.toString()
    };
  }

  void clearInputs() {
    EmailInputWidgetState.email.clear();
    PasswordInputWidgetState.password.clear();
  }

  void disposeInputs() {
    EmailInputWidgetState.email.dispose();
    PasswordInputWidgetState.password.dispose();
  }
}