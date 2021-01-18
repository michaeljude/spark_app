
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spark_app/application/login/registration/driver_detail_screen.dart';
import 'package:spark_app/application/login/registration/registration_bloc.dart';
import 'package:spark_app/application/login/registration/registration_event.dart';
import 'package:spark_app/application/login/registration/registration_state.dart';
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
  RegistrationBloc _bloc;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _contactNoController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _bloc = RegistrationBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (BuildContext context, RegistrationState state) {

        },
        builder: (BuildContext context, RegistrationState state){
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
                            if(_bloc.validateAccountFields(context,
                                _emailController,
                                _contactNoController,
                                _passwordController,
                                _confirmPasswordController)) {
                              _bloc.add(RegisterAccount(
                                  _emailController.text,
                                  _contactNoController.text,
                                  _passwordController.text,
                                  _confirmPasswordController.text
                              ));
                              _goToPersonalInformationScreen(context);
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
        },
    );
  }

  void _goToPersonalInformationScreen(BuildContext context)
  => Navigator.pushNamed(context, PersonalInformationScreen.routeName);

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
  RegistrationBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = context.bloc<RegistrationBloc>();
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
                      if(_bloc.validateUserFields(context,
                          _firstNameController,
                          _lastNameController,
                          _birthdayNameController)) {
                        _bloc.add(RegisterUser(
                            _firstNameController.text,
                            _lastNameController.text,
                            radioValue,
                            _birthdayNameController.text,
                        ));
                        _goToDriverDetailScreen(context);
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


















