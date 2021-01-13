class Validation {
  Validation();

  bool isEmailValid(String email) {

    if (email == null || email.isEmpty) return false;

    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool isMobileValid(String mobile) {
    if (mobile == null || mobile.isEmpty) return false;
    if (mobile.length < 9) return false;
    else return true;
  }
}