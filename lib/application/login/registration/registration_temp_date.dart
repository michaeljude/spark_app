class RegistrationCache {

  static String email;
  static String contactNumber;
  static String password;
  static String confirmPassword;
  static String firstName;
  static String lastName;
  static String gender;
  static String birthday;
  static String plateNo;
  static String carModel;
  static String description;
  static List<String> carPhotosList;
  static List<String> licenseList;

  static void clearCache() {
    email = null;
    contactNumber = null;
    password = null;
    confirmPassword = null;
    firstName = null;
    lastName = null;
    gender = null;
    birthday = null;
    plateNo = null;
    carModel = null;
    description = null;
    carPhotosList = null;
    licenseList = null;
  }

}