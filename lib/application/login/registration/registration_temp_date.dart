class RegistrationCache {

  static String email;
  static String contactNumber;
  static String password;
  static String confirmPassword;
  static String firstName;
  static String lastName;
  static String gender;
  static String birthday;

  static void clearCache() {
    email = null;
    contactNumber = null;
    password = null;
    confirmPassword = null;
    firstName = null;
    lastName = null;
    gender = null;
    birthday = null;
  }

}