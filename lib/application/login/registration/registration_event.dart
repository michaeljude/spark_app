abstract class RegistrationEvent{}

class RegisterAccount extends RegistrationEvent{

  String firstName;
  String lastName;
  String email;
  String contactNumber;
  String password;
  String confirmPassword;

  RegisterAccount(this.firstName, this.lastName, this.email, this.contactNumber, this.password, this.confirmPassword);
}
class RegisterUser extends RegistrationEvent{

  String firstName;
  String lastName;
  String gender;
  String birthday;

  RegisterUser(this.firstName, this.lastName, this.gender, this.birthday);
}