import 'package:flutter/cupertino.dart';
import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/models/registration/registration_response.dart';

class RegistrationRespository {

  RegistrationRespository(this._apiService);
  ApiService _apiService = ApiService();

  Future<RegistrationResponseModel> register_user({
    @required String token,
    @required String firstname,
    @required String lastname,
    @required String email,
    @required String password,
    @required String contact_no
}) =>
      _apiService.register_user(
          device_token: token,
          firstname: firstname,
          lastname: lastname,
          email: email,
          password: password,
          contact_no: contact_no
      );

}