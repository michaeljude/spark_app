import 'package:email_validator/email_validator.dart';

class ValidationUtils {

  ValidationUtils();

  factory ValidationUtils.instance() {
      return ValidationUtils();
  }

  bool isEmailValid(String email) => EmailValidator.validate(email);

  bool isMobileValid(String mobileNo) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (mobileNo.length == 0) {
      return false;
    }
    else if (!regExp.hasMatch(mobileNo)) {
      return false;
    }
    return true;
  }

  bool isNullOrEmpty(String value) {
    if (value != null && value.isNotEmpty) return false;
    else return true;
  }

}