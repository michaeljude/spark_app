abstract class LoginEvent{}

class LoginViaGuestEvent extends LoginEvent {
  String email;
  String password;
  String token;
  LoginViaGuestEvent(this.email, this.password, this.token);
}