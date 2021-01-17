import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/application/reusablescreens/camera_screen.dart';
import 'package:spark_app/core/widgets/aligned_padding.dart';
import 'package:spark_app/core/widgets/labeled_text_field.dart';
import 'package:spark_app/core/widgets/labeled_widget.dart';
import 'package:spark_app/core/widgets/login_button.dart';
import 'package:spark_app/core/widgets/spark_text.dart';

class DriverDetailScreen extends StatefulWidget {

  static final String routeName = "/driver-detail";

  @override
  State<StatefulWidget> createState() => _DriverDetailScreen();

}

class _DriverDetailScreen extends State<DriverDetailScreen> {
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(34.0),
            child: Column(
              children: <Widget>[
                AlignedPadding(
                  child: SparkText(
                      text: "Vehicle Information",
                      size: 18,
                      fontWeight: FontWeight.bold
                  ),
                  edgeInsets: const EdgeInsets.only(bottom: 18),
                  alignment: Alignment.centerLeft,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: LabeledTextField(
                    title: "Plate No.",
                    hint: "Enter your plate nno",
                    isRequired: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: LabeledTextField(
                    title: "Car model",
                    hint: "Enter your car model",
                    isRequired: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: LabeledTextField(
                    title: "Description",
                    hint: "Ex. Color black. Have a scratch in front of the car",
                    isRequired: true,
                    isMultiline: true,
                  ),
                ),
                AlignedPadding(
                  child: SparkText(
                      text: "Car Photos",
                      size: 18,
                      fontWeight: FontWeight.bold
                  ),
                  edgeInsets: const EdgeInsets.only(bottom: 18, top: 18),
                  alignment: Alignment.centerLeft,
                ),
                LabeledWidget(
                    title: "Upload ID Photo",
                    subtitle: "Pro tip: Make sure it's clear and the whole card is seen "
                        "in the shot. Don't forget to check it's expiry date!",
                    child: LogoButton(
                      icon: Icons.camera_alt_outlined,
                      iconColor: Colors.white,
                      color: const Color(0xff117E96),
                      buttonText: "Take car photo",
                      action: () => _goToCamera(context),
                    ),
                ),
                AlignedPadding(
                  child: SparkText(
                      text: "Driver's License",
                      size: 18,
                      fontWeight: FontWeight.bold
                  ),
                  edgeInsets: const EdgeInsets.only(bottom: 18, top: 18),
                  alignment: Alignment.centerLeft,
                ),
                LabeledWidget(
                    title: "Upload ID Photo",
                    subtitle: "Pro tip: Make sure it's clear and the whole card is seen "
                        "in the shot. Don't forget to check it's expiry date!",
                    child: LogoButton(
                      icon: Icons.camera_alt_outlined,
                      iconColor: Colors.white,
                      color: const Color(0xff117E96),
                      buttonText: "Tap to take ID photo",
                      action: () => {},
                    ),
                ),

                AlignedPadding(
                  edgeInsets: const EdgeInsets.only(bottom: 20,top: 250),
                  alignment: Alignment.bottomCenter,
                  child: LogoButton(
                    color: const Color(0xff19BA19),
                    buttonText: "SIGN UP",
                    action: () {

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goToCamera(BuildContext context) => Navigator.pushNamed(context, CameraScreen.routeName);

}