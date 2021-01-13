import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_app/core/utils/enums.dart';
import 'package:spark_app/core/utils/validation.dart';
import 'package:spark_app/core/widgets/error_text_with_icon.dart';
import 'package:spark_app/core/widgets/labeled_text_field.dart';
import 'package:spark_app/core/widgets/login_button.dart';
import 'package:spark_app/core/widgets/spark_text.dart';

class RegistrationScreen extends StatefulWidget {

  static String routeName = "/registration";

  @override
  State<StatefulWidget> createState() => _RegistrationScreen();

}

class _RegistrationScreen extends State<RegistrationScreen> {

  bool _isVisible = false;
  TextEditingController _emailController;
  TextEditingController _mobileController;
  TextEditingController _passwordController;
  TextEditingController _confirmPassowrdController;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(34.0),
            child: Column(
                children: <Widget>[
                  SparkText(
                    text: "Register as a river",
                    bottomMargin: 18,
                    isBold: true,
                    size: 18,
                  ),
                  SparkText(
                    text: "Yiwdaindjksbajdk wuhdjkabd awukdj asdjkahw dahduiawhduiahs dhawdhjaksd uaiw",
                    size: 16,
                    bottomMargin: 24,
                  ),
                  SparkText(
                    text: "Account Information",
                    bottomMargin: 18,
                    isBold: true,
                    size: 18,
                  ),
                  ErrorTextWithIcon(text: "The password confirmation does not match.", isVisible: _isVisible,),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: LabeledTextField(
                      title: "Email Address",
                      hint: "Enter your email addresss",
                      textController: _emailController,
                      isRequired: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: LabeledTextField(
                      title: "Contact No.",
                      hint: "0900 000 0000",
                      textController: _mobileController,
                      isRequired: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: LabeledTextField(
                      title: "Password",
                      hint: "Your password",
                      isTappable: true,
                      type: TextFieldType.PASSWORD,
                      textController: _passwordController,
                      isRequired: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: LabeledTextField(
                      title: "Confirm Password",
                      hint: "Confirm pasword",
                      isTappable: true,
                      type: TextFieldType.PASSWORD,
                      textController: _confirmPassowrdController,
                      isRequired: true,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 20,),
                      alignment: Alignment.center,
                      child: LogoButton(
                        color: const Color(0xff19BA19),
                        buttonText: "CONTINUE",
                        action: () {
                          if(_validation(context)) {
                            setState(() {
                              _isVisible = false;
                            });
                            Navigator.pushNamed(
                                context, PersonalInformationScreen.routeName);
                          } else {
                            setState(() {
                              _isVisible = true;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }

  void _init() {
    _emailController = TextEditingController();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPassowrdController = TextEditingController();
  }

  bool _validation(BuildContext context) {
    bool isValid = true;
    isValid = Provider.of<Validation>(context, listen: false).isEmailValid(_emailController.text);
    isValid = Provider.of<Validation>(context, listen: false).isMobileValid(_mobileController.text);
    return isValid;
  }

}

class PersonalInformationScreen extends StatefulWidget {

  static String routeName = "/personal-information";

  @override
  State<StatefulWidget> createState() => _PersonalInformationScreen();
}


class _PersonalInformationScreen extends State<PersonalInformationScreen> {

  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _birthdayController;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _birthdayController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            children: <Widget>[
              SparkText(
                text: "Personal Information",
                bottomMargin: 18,
                isBold: true,
                size: 18,
              ),
              ErrorTextWithIcon(text: "The password confirmation does not match.", isVisible: _isVisible,),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: LabeledTextField(
                  title: "First name",
                  hint: "Enter your first name",
                  textController: _firstNameController,
                  isRequired: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: LabeledTextField(
                  title: "Last name",
                  hint: "Enter your last name",
                  textController: _lastNameController,
                  isRequired: true,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: new LabeledTextField(
                    title: "Birthday",
                    hint: "SelectDate",
                    isTappable: true,
                    type: TextFieldType.BIRTHDATE,
                    textController: _birthdayController,
                    isRequired: true,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20,),
                  alignment: Alignment.center,
                  child: LogoButton(
                    color: const Color(0xff19BA19),
                    buttonText: "CONTINUE",
                    action: () {

                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

}















