
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_app/application/login/registration/driver_detail_screen.dart';
import 'package:spark_app/application/login/registration/registration_temp_date.dart';
import 'package:spark_app/core/utils/utils.dart';
import 'package:spark_app/core/widgets/labeled_text_field.dart';
import 'package:spark_app/core/widgets/login_button.dart';
import 'package:spark_app/core/widgets/spark_text.dart';

class RegistrationScreen extends StatefulWidget {

  static String routeName = "/registration";

  @override
  State<StatefulWidget> createState() => _RegistrationScreen();

}

class _RegistrationScreen extends State<RegistrationScreen> {

  TextEditingController _emailController;
  TextEditingController _contactNoController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _contactNoController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: "BackButton",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(bottom: 18),
                  child: SparkText(
                    text: "Register as a driver",
                    size: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(bottom: 24),
                  child: SparkText(
                    text: "Yiwdaindjksbajdk wuhdjkabd awukdj asdjkahw dahduiawhduiahs dhawdhjaksd uaiw"
                  )
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(bottom: 18),
                  child: SparkText(
                      text: "Account Information",
                      size: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: LabeledTextField(
                    title: "Email Address",
                    hint: "Enter your email addresss",
                    textController: _emailController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: LabeledTextField(
                    title: "Contact No.",
                    hint: "0900 000 0000",
                    textController: _contactNoController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: LabeledTextField(
                    title: "Password",
                    hint: "Your password",
                    textController: _passwordController,
                    isTappable: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: LabeledTextField(
                    title: "Confirm Password",
                    hint: "Confirm password",
                    textController: _confirmPasswordController,
                    isTappable: true,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20,),
                    alignment: Alignment.bottomCenter,
                    child: LogoButton(
                      color: const Color(0xff19BA19),
                      buttonText: "CONTINUE",
                      action: () {
                        if(_validateFields(context)) {
                          _goToPersonalInformationScreen(context);
                          RegistrationCache.email = _emailController.text;
                          RegistrationCache.contactNumber = _contactNoController.text;
                          RegistrationCache.password = _passwordController.text;
                          RegistrationCache.confirmPassword = _confirmPasswordController.text;
                        }
                        else _showErrorDialog(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }

  void _goToPersonalInformationScreen(BuildContext context)
  => Navigator.pushNamed(context, PersonalInformationScreen.routeName);

  bool _validateFields(BuildContext context) {
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

  void _showErrorDialog(BuildContext context) => showDialog(context: context, builder: (_) => AlertDialog(
        title: Text("Some Error"),
        content: Text("Something went wrong"),
        actions: <Widget>[
          FlatButton(onPressed: () => Navigator.pop(_), child: Text("Close"))
        ],
    ));

}

class PersonalInformationScreen extends StatefulWidget {

  static final String routeName = "/personal-information";

  @override
  State<StatefulWidget> createState() => _PersonalInformationScreen();

}

class _PersonalInformationScreen extends State<PersonalInformationScreen> {

  int _value = 0;
  String radioValue;
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _birthdayNameController;

  @override
  void initState() {
    super.initState();

    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _birthdayNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: "BackButton",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: SparkText(
                      text: "Personal Information",
                      size: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: LabeledTextField(
                  title: "First name",
                  hint: "Enter your first name",
                  isRequired: true,
                  textController: _firstNameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: LabeledTextField(
                  title: "Last name",
                  hint: "Enter your last name",
                  isRequired: true,
                  textController: _lastNameController,
                ),
              ),
              radioGroup(),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: LabeledTextField(
                  title: "Birthday",
                  hint: "Select date",
                  textController: _birthdayNameController,
                  isRequired: true,
                  isTappable: true,
                  textFieldType: TextFieldType.BIRTHDATE,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20,),
                  alignment: Alignment.bottomCenter,
                  child: LogoButton(
                    color: const Color(0xff19BA19),
                    buttonText: "CONTINUE",
                    action: () {
                      if(_validateFields(context)) {
                        _goToDriverDetailScreen(context);
                        RegistrationCache.firstName = _firstNameController.text;
                        RegistrationCache.lastName = _lastNameController.text;
                        RegistrationCache.gender = radioValue;
                        RegistrationCache.birthday = _birthdayNameController.text;
                      }
                      else
                        _showErrorDialog(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateFields(BuildContext context) {
    if(_firstNameController.text.isEmpty) return false;
    if(_lastNameController.text.isEmpty) return false;
    if(_birthdayNameController.text.isEmpty) return false;
    return true;
  }

  void _showErrorDialog(BuildContext context) => showDialog(context: context, builder: (_) => AlertDialog(
    title: Text("Some Error"),
    content: Text("Something went wrong"),
    actions: <Widget>[
      FlatButton(onPressed: () => Navigator.pop(_), child: Text("Close"))
    ],
  ));


  void _goToDriverDetailScreen(BuildContext context) => Navigator.pushNamed(context, DriverDetailScreen.routeName);

  Widget radioGroup() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(padding: const EdgeInsets.only(bottom: 12, top: 18),
            child: SparkText(text: "Gender", isRequired: true,),),
        ),
        Row(
          children: [
            Radio(value: 0, groupValue: _value, onChanged: _onRadioChangeListener),
            SparkText(text: "Male"),
            Radio(value: 1, groupValue: _value, onChanged: _onRadioChangeListener),
            SparkText(text: "Female"),
          ],
        )
      ],
    );
  }

  void _onRadioChangeListener(int value) {
    setState(() {
      _value = value;
      switch(value) {
        case 0:
          radioValue = "Male";
          break;
        case 1:
          radioValue = "Female";
          break;
      }
    });
  }
}


















