import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:spark_app/application/login/loginviaguest/landing_screen.dart';
import 'package:spark_app/application/login/registration/driver_detail_screen.dart';
import 'package:spark_app/application/login/registration/registration_bloc.dart';
import 'package:spark_app/application/login/registration/registration_event.dart';
import 'package:spark_app/application/login/registration/registration_state.dart';
import 'package:spark_app/core/utils/constant_enums.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
import 'package:spark_app/core/widgets/labeled_text_field_no_icon.dart';
import 'package:spark_app/core/widgets/spark_text.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:spark_app/theme/app_theme.dart';

class RegistrationScreen extends StatefulWidget {
  static String routeName = "/registration";

  @override
  State<StatefulWidget> createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {
  RegistrationBloc _registrationBloc;
  TextEditingController _emailController;
  TextEditingController _contactNoController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;

  ProgressDialog _progressDialog;

  @override
  void initState() {
    super.initState();
    _registrationBloc = BlocProvider.of<RegistrationBloc>(context);
    _emailController = TextEditingController(text: 'test@gmail.com');
    _contactNoController = TextEditingController(text: '09101367520');
    _passwordController = TextEditingController(text: '123456');
    _confirmPasswordController = TextEditingController(text: '123456');
    _firstNameController = TextEditingController(text: 'Spark1');
    _lastNameController = TextEditingController(text: 'Spark1');

    // _bloc = RegistrationBloc();

    setProgressDialog();
  }

  void setProgressDialog() {
    _progressDialog = ProgressDialog(this.context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    _progressDialog.style(
      message: 'Please wait...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (BuildContext context, RegistrationState state) {
        if (state is RegistrationSuccessState) {
          debugPrint("LoginSuccessState");
          _progressDialog.hide();

          _loginViaGuest(context);
        } else if (state is RegistrationStartedState) {
          debugPrint("RegistrationStartedState");
          _progressDialog.show();
        } else if (state is RegistrationFailedState) {
          debugPrint("RegistrationFailedState");
          _progressDialog.hide();
        }
      },

        child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('#ffffff'),
            elevation: 0.0,

            leading: IconButton(
              padding: const EdgeInsets.only(left:0, top: 10),
              icon: Icon(
                FeatherIcons.chevronLeft,
                color: HexColor('#626262'),
                size: 30,
              ),
              onPressed: () {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                Navigator.pop(context);
              },
              tooltip: "BackButton",
            ),
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 10),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(bottom: 18),
                      child: SparkText(
                          text: "Register as a booker",
                          size: 18,
                          color: HexColor('#525252'),
                          fontWeight: FontWeight.w600,),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(bottom: 24),
                        child: SparkText(
                            text:
                                "Hey buddy! Provide your basic information here")),
                    // Container(
                    //   alignment: Alignment.centerLeft,
                    //   padding: const EdgeInsets.only(bottom: 18),
                    //   child: SparkText(
                    //       text: "Account Information",
                    //       size: 18,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: LabeledTextFieldNoIcon(
                        title: "First Name",
                        hint: "Enter your first name",
                        textController: _firstNameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: LabeledTextFieldNoIcon(
                        title: "Last Name",
                        hint: "Enter your last name",
                        textController: _lastNameController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: LabeledTextFieldNoIcon(
                        title: "Contact No.",
                        hint: "0900 000 0000",
                        textController: _contactNoController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: LabeledTextFieldNoIcon(
                        title: "Email Address",
                        hint: "Enter your email address",
                        textController: _emailController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Theme(
                        child: LabeledTextFieldNoIcon(
                          title: "Password",
                          hint: "Your password",
                          textController: _passwordController,
                          isTappable: true,
                        ),
                        data:
                        Theme.of(context).copyWith(primaryColor: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Theme(
                        child: LabeledTextFieldNoIcon(
                          title: "Confirm Password",

                          hint: "Confirm password",
                          textController: _confirmPasswordController,
                          isTappable: true,
                        ),
                        data:
                        Theme.of(context).copyWith(primaryColor: Colors.green),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      alignment: Alignment.bottomCenter,
                      child: SparkButton(
                        color: const Color(0xff19BA19),
                        textcolor: const Color(0xffffffff),
                        buttonText: "CONTINUE",
                        action: () {
                          if (_registrationBloc.validateAccountFields(
                              context,
                              _firstNameController,
                              _lastNameController,
                              _emailController,
                              _contactNoController,
                              _passwordController,
                              _confirmPasswordController)) {
                            _registrationBloc.add(RegisterAccount(
                                _firstNameController.text,
                                _lastNameController.text,
                                _emailController.text,
                                _contactNoController.text,
                                _passwordController.text,
                                _confirmPasswordController.text));
                            // _goToPersonalInformationScreen(context);
                          } else
                            _showErrorDialog(context);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(bottom: 50, left: 20, right: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(color: Colors.black, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(text: "Have a Spark account?",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#117E96'),
                                  ),
                                ),
                                TextSpan(
                                    text: ' Login',
                                    style: TextStyle(
                                      color: HexColor('#117E96'),
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        debugPrint("LOGIN NOW");
                                        _loginViaGuest(context);
                                      }),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }

  // void _goToPersonalInformationScreen(BuildContext context) =>
  //     Navigator.pushNamed(context, PersonalInformationScreen.routeName);

  void _loginViaGuest(BuildContext context) =>
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) =>
          new LoginScreen())
      );



  void _showErrorDialog(BuildContext context) => showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Some Error"),
            content: Text("Something went wrong"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(_), child: Text("Close"))
            ],
          ));
}

// class PersonalInformationScreen extends StatefulWidget {
//   static final String routeName = "/personal-information";
//
//   @override
//   State<StatefulWidget> createState() => _PersonalInformationScreen();
// }

// class _PersonalInformationScreen extends State<PersonalInformationScreen> {
//   int _value = 0;
//   String radioValue;
//   TextEditingController _firstNameController;
//   TextEditingController _lastNameController;
//   TextEditingController _birthdayNameController;
//   RegistrationBloc _bloc;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _bloc = context.bloc<RegistrationBloc>();
//     _firstNameController = TextEditingController(text: 'Spark1');
//     _lastNameController = TextEditingController(text: 'Spark1');
//     _birthdayNameController = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           tooltip: "BackButton",
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(color: Colors.white),
//           child: Padding(
//             padding: const EdgeInsets.all(34.0),
//             child: Column(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 18),
//                     child: SparkText(
//                         text: "Personal Information",
//                         size: 18,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 12),
//                   child: LabeledTextFieldNoIcon(
//                     title: "First name",
//                     hint: "Enter your first name",
//                     isRequired: true,
//                     textController: _firstNameController,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 12),
//                   child: LabeledTextFieldNoIcon(
//                     title: "Last name",
//                     hint: "Enter your last name",
//                     isRequired: true,
//                     textController: _lastNameController,
//                   ),
//                 ),
//                 radioGroup(),
//                 Padding(
//                   padding: EdgeInsets.only(top: 12),
//                   child: LabeledTextFieldNoIcon(
//                     title: "Birthday",
//                     hint: "Select date",
//                     textController: _birthdayNameController,
//                     isRequired: true,
//                     isTappable: true,
//                     textFieldType: TextFieldType.BIRTHDATE,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   padding: const EdgeInsets.only(
//                     bottom: 20,
//                   ),
//                   alignment: Alignment.bottomCenter,
//                   child: SparkButton(
//                     color: const Color(0xff19BA19),
//                     buttonText: "CONTINUE",
//                     action: () {
//                       if (_bloc.validateUserFields(
//                           context,
//                           _firstNameController,
//                           _lastNameController,
//                           _birthdayNameController)) {
//                         _bloc.add(RegisterUser(
//                           _firstNameController.text,
//                           _lastNameController.text,
//                           radioValue,
//                           _birthdayNameController.text,
//                         ));
//                         _goToDriverDetailScreen(context);
//                       } else
//                         _showErrorDialog(context);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }


//
//   void _showErrorDialog(BuildContext context) => showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//             title: Text("Some Error"),
//             content: Text("Something went wrong"),
//             actions: <Widget>[
//               FlatButton(
//                   onPressed: () => Navigator.pop(_), child: Text("Close"))
//             ],
//           ));
//
//   void _goToDriverDetailScreen(BuildContext context) =>
//       Navigator.of(context).push(DriverDetailsScreen.route(_bloc));
//
//   Widget radioGroup() {
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 12, top: 18),
//             child: SparkText(
//               text: "Gender",
//               isRequired: true,
//               position: Positions.RIGHT,
//             ),
//           ),
//         ),
//         Row(
//           children: [
//             Radio(
//                 value: 0,
//                 groupValue: _value,
//                 onChanged: _onRadioChangeListener),
//             SparkText(text: "Male"),
//             Radio(
//                 value: 1,
//                 groupValue: _value,
//                 onChanged: _onRadioChangeListener),
//             SparkText(text: "Female"),
//           ],
//         )
//       ],
//     );
//   }
//
//   void _onRadioChangeListener(int value) {
//     setState(() {
//       _value = value;
//       switch (value) {
//         case 0:
//           radioValue = "Male";
//           break;
//         case 1:
//           radioValue = "Female";
//           break;
//       }
//     });
//   }
// }
