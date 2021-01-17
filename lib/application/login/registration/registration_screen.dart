
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/application/login/registration/driver_detail_screen.dart';
import 'package:spark_app/core/widgets/labeled_text_field.dart';
import 'package:spark_app/core/widgets/login_button.dart';
import 'package:spark_app/core/widgets/spark_text.dart';

class RegistrationScreen extends StatefulWidget {

  static String routeName = "/registration";

  @override
  State<StatefulWidget> createState() => _RegistrationScreen();

}

class _RegistrationScreen extends State<RegistrationScreen> {
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: LabeledTextField(
                    title: "Contact No.",
                    hint: "0900 000 0000",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: LabeledTextField(
                    title: "Password",
                    hint: "Your password",
                    isTappable: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: LabeledTextField(
                    title: "Confirm Password",
                    hint: "Confirm pasword",
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
                        _goToPersonalInformationScreen(context);
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

}

class PersonalInformationScreen extends StatefulWidget {

  static final String routeName = "/personal-information";

  @override
  State<StatefulWidget> createState() => _PersonalInformationScreen();

}

class _PersonalInformationScreen extends State<PersonalInformationScreen> {

  int _value = 0;
  String radioValue;

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
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: LabeledTextField(
                  title: "Last name",
                  hint: "Enter your last name",
                  isRequired: true,
                ),
              ),
              radioGroup(),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: LabeledTextField(
                  title: "Birthday",
                  hint: "Select date",
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
                        _goToDriverDetailScreen(context);
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


















