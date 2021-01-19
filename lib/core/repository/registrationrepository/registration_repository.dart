import 'package:flutter/cupertino.dart';
import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/models/registration/registration_response.dart';

class RegistrationRespository {

  ApiService _apiService = ApiService.instance;

  Future<RegistrationResponseModel> register({
    @required String firstname,
    @required String lastname,
    @required String email,
    @required String password,
    @required String contact_no,
    @required String gender,
    @required String birthday,
    @required String plate_no,
    @required String car_model,
    @required String car_description,
    @required List<String> car_photo,
    @required List<String> driver_license,
}) =>
      _apiService.register(
          firstname: firstname,
          lastname: lastname,
          email: email,
          password: password,
          contact_no: contact_no,
          gender: gender,
          birthday: birthday,
          plate_no:plate_no,
          car_model:car_model,
          car_description:car_description,
          car_photo:car_photo,
          driver_license:driver_license
      );

}