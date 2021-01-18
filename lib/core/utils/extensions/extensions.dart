import 'package:email_validator/email_validator.dart';

extension StringExtension  on String {
  bool isEmailValid() => EmailValidator.validate(this);

  bool isNullOrEmpty() {
    if (this != null && this.isNotEmpty) return false;
    else return true;
  }
}