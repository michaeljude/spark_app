import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/core/widgets/labeled_text_field.dart';
import 'package:spark_app/core/widgets/login_button.dart';

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
                  child: Text(
                    "Register as a river",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    "Yiwdaindjksbajdk wuhdjkabd awukdj asdjkahw dahduiawhduiahs dhawdhjaksd uaiw",
                    style: TextStyle(
                        fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Text(
                    "Account Information",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
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
                    isPasswordField: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: LabeledTextField(
                    title: "Confirm Password",
                    hint: "Confirm pasword",
                    isPasswordField: true,
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

}