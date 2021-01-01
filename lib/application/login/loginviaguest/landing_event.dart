abstract class LoginEvent{}

class LoginViaGuestEvent extends LoginEvent {
  String email;
  String password;
  LoginViaGuestEvent(this.email, this.password);
}