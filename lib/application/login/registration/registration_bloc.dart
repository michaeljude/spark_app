import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spark_app/application/login/registration/registration_event.dart';
import 'package:spark_app/application/login/registration/registration_state.dart';
import 'package:spark_app/application/login/registration/registration_temp_date.dart';
import 'package:spark_app/core/repository/registrationrepository/registration_repository.dart';
import 'package:spark_app/core/utils/utils.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {

  RegistrationBloc(
      this.repository
      ) : super(RegistrationInitialState());

  RegistrationRespository repository;

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async*{

      if(event is RegisterAccountEvent) {
        yield RegistrationLoadingState();

        try {
          var response = await repository.register(
              firstname: RegistrationCache.firstName,
              lastname: RegistrationCache.lastName,
              email: RegistrationCache.email,
              password: RegistrationCache.password,
              contact_no: RegistrationCache.contactNumber,
              gender: RegistrationCache.gender,
              birthday: RegistrationCache.birthday,
              plate_no: RegistrationCache.plateNo,
              car_model: RegistrationCache.carModel,
              car_description: RegistrationCache.description,
              car_photo: RegistrationCache.carPhotosList,
              driver_license: RegistrationCache.licenseList
          );

          if(response.message == "User was created") {
            RegistrationCache.clearCache();
            yield RegistrationSuccessfullyCreated();
          }
        } catch(e) {
            yield RegistrationFailed();
        }
      }

  }


  bool validateAccountFields(BuildContext context,
      TextEditingController _emailController,
      TextEditingController _contactNoController,
      TextEditingController _passwordController,
      TextEditingController _confirmPasswordController
      ) {
    ValidationUtils validationUtils = Provider.of<ValidationUtils>(context, listen: false);
    if (!validationUtils.isEmailValid(_emailController.text)
        && _emailController.text.isEmpty) {
      return false;
    }
    if (!validationUtils.isMobileValid(_contactNoController.text)
        && _contactNoController.text.isEmpty) {
      return false;
    }
    if(validationUtils.isNullOrEmpty(_passwordController.text)) return false;
    if(validationUtils.isNullOrEmpty(_confirmPasswordController.text)) return false;

    if(_passwordController.text != _confirmPasswordController.text) return false;

    return true;
  }


  bool validateUserFields(BuildContext context,
      TextEditingController _firstNameController,
      TextEditingController _lastNameController,
      TextEditingController _birthdayNameController,) {
    if(_firstNameController.text.isEmpty) return false;
    if(_lastNameController.text.isEmpty) return false;
    if(_birthdayNameController.text.isEmpty) return false;
    return true;
  }

}