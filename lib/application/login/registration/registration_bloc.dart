import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spark_app/application/login/registration/registration_event.dart';
import 'package:spark_app/application/login/registration/registration_state.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';
import 'package:spark_app/core/repository/registrationrepository/registration_repository.dart';
import 'package:spark_app/core/utils/utils.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({this.repository, this.buildContext}) : super(RegistrationInitialState());

  RegistrationRespository repository;
  BuildContext buildContext;

  String _email;
  String _contactNumber;
  String _password;
  String _confirmPassword;
  String _firstName;
  String _lastName;
  String _gender;
  String _birthday;
  List<String> _carPhotos;
  List<String> _licensePhotos;

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {

    if (event is RegisterAccount) {
      yield RegistrationStartedState();
      _firstName = event.firstName;
      _lastName = event.lastName;
      _email = event.email;
      _contactNumber = event.contactNumber;
      _password = event.password;
      _confirmPassword = event.confirmPassword;
      //
       debugPrint(_firstName+" "+_lastName+" "+_email+" "+_contactNumber+" "+_password);
      try {
        var response = await repository.register_user(firstname: event.firstName, lastname: event.lastName,  email: event.email, password: event.password, contact_no: event.contactNumber);
        // var _localPersistence = LocalPersistence.instance();
        if(response.message == "User was created.") {
          // await _localPersistence.setCurrentUser(LocalPersistence.currentUser, event.email);
          // await _localPersistence.setAppToken(
          //     LocalPersistence.appToken+event.email,
          //     response.token
          // );
          yield RegistrationSuccessState();
        }
      }
      on DioError catch (e) {
        throw Exception(e.response?.data);
        yield RegistrationFailedState();
    if(e.response.statusCode == 404){
    print(e.response.statusCode);
    }else{
    print(e.message);
    print(e.request);
    }
    }
      // on DioError {
      //
      // } catch(e) {
      //   yield RegistrationFailedState();
      // }
    }
    // if (event is RegisterUser) {
    //   _firstName = event.firstName;
    //   _lastName = event.lastName;
    //   _gender = event.gender;
    //   _birthday = event.birthday;
    // }
  }

  bool validateAccountFields(
      BuildContext context,
      TextEditingController _firstNameController,
      TextEditingController _lastNameController,
      TextEditingController _emailController,
      TextEditingController _contactNoController,
      TextEditingController _passwordController,
      TextEditingController _confirmPasswordController) {
    ValidationUtils validationUtils =
        Provider.of<ValidationUtils>(context, listen: false);
    if (!validationUtils.isEmailValid(_emailController.text) &&
        _emailController.text.isEmpty) {
      return false;
    }
    if (!validationUtils.isMobileValid(_contactNoController.text) &&
        _contactNoController.text.isEmpty) {
      return false;
    }
    if (validationUtils.isNullOrEmpty(_passwordController.text)) return false;
    if (validationUtils.isNullOrEmpty(_confirmPasswordController.text))
      return false;

    if (_passwordController.text != _confirmPasswordController.text)
      return false;
    if (_firstNameController.text.isEmpty) return false;
    if (_lastNameController.text.isEmpty) return false;

    return true;
  }

  bool validateUserFields(
    BuildContext context,
    TextEditingController _firstNameController,
    TextEditingController _lastNameController,
    TextEditingController _birthdayNameController,
  ) {
    if (_firstNameController.text.isEmpty) return false;
    if (_lastNameController.text.isEmpty) return false;
    if (_birthdayNameController.text.isEmpty) return false;
    return true;
  }

  String get email => _email;

  List<String> get license => _licensePhotos;

  List<String> get cars => _carPhotos;

  String get contactNumber => _contactNumber;

  String get password => _password;

  String get confirmPassword => _confirmPassword;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get gender => _gender;

  String get birthday => _birthday;
}
