import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/login/registration/registration_bloc.dart';
import 'package:spark_app/application/login/registration/registration_state.dart';
import 'package:spark_app/application/reusablescreens/camera_screen.dart';
import 'package:spark_app/core/widgets/aligned_padding.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
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
  RegistrationBloc _bloc;
  int _carCount = 1;
  int _licenseCount = 1;
  List<String> _carPhotoList;
  List<String> _licensePhotoList;

  @override
  void initState() {
    super.initState();
    _carPhotoList = List<String>();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<RegistrationBloc>(context);

    return BlocConsumer<RegistrationBloc, RegistrationState>(
        builder: (BuildContext context, RegistrationState state) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  tooltip: "BackButton",
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(34.0),
                    child: Column(
                      children: <Widget>[
                        AlignedPadding(
                          child: SparkText(
                              text: "Vehicle Information",
                              size: 18,
                              fontWeight: FontWeight.bold),
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
                            hint:
                                "Ex. Color black. Have a scratch in front of the car",
                            isRequired: true,
                            isMultiline: true,
                          ),
                        ),
                        AlignedPadding(
                          child: SparkText(
                              text: "Car Photos",
                              size: 18,
                              fontWeight: FontWeight.bold),
                          edgeInsets:
                              const EdgeInsets.only(bottom: 18, top: 18),
                          alignment: Alignment.centerLeft,
                        ),
                        LabeledWidget(
                            title: "Upload ID Photo",
                            subtitle:
                                "Pro tip: Make sure it's clear and the whole card is seen "
                                "in the shot. Don't forget to check it's expiry date!",
                            child: SizedBox(
                              height: 150,
                              width: double.infinity,
                              child: _buildCarListView(),
                            )),
                        AlignedPadding(
                          child: SparkText(
                              text: "Driver's License",
                              size: 18,
                              fontWeight: FontWeight.bold),
                          edgeInsets:
                              const EdgeInsets.only(bottom: 18, top: 18),
                          alignment: Alignment.centerLeft,
                        ),
                        LabeledWidget(
                            title: "Upload ID Photo",
                            subtitle:
                                "Pro tip: Make sure it's clear and the whole card is seen "
                                "in the shot. Don't forget to check it's expiry date!",
                            child: SizedBox(
                              height: 150,
                              width: double.infinity,
                              child: _buildLicenseListView(),
                            )),
                        AlignedPadding(
                          edgeInsets:
                              const EdgeInsets.only(bottom: 20, top: 100),
                          alignment: Alignment.bottomCenter,
                          child: SparkButton(
                            color: const Color(0xff19BA19),
                            buttonText: "SIGN UP",
                            action: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, RegistrationState state) {});
  }

  Widget _buildCarListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _carCount,
        itemBuilder: (BuildContext context, int index) {
          return _carWidget(index);
        });
  }

  Widget _carWidget(int index) {
    if ((index == _carCount - 1) || _carCount <= 1) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 200,
            height: 150,
            child: GestureDetector(
              onTap: () {
                _goToCamera(context, PhotoType.CAR);
              },
              child: DottedBorder(
                dashPattern: [5, 3],
                child: Center(
                  child: Icon(Icons.add),
                ),
              ),
            )),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 200,
            height: 150,
            child: Image.file(
              File(_carPhotoList[index]),
              fit: BoxFit.fitWidth,
            )),
      );
    }
  }

  Widget _buildLicenseListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _licenseCount,
        itemBuilder: (BuildContext context, int index) {
          return _licenseWidget(index);
        });
  }

  Widget _licenseWidget(int index) {
    if ((index == _licenseCount - 1) || _licenseCount <= 1) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 200,
            height: 150,
            child: GestureDetector(
              onTap: () {
                _goToCamera(context, PhotoType.LICENSE);
              },
              child: DottedBorder(
                dashPattern: [5, 3],
                child: Center(
                  child: Icon(Icons.add),
                ),
              ),
            )),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 200,
            height: 150,
            child: Image.file(
              File(_licensePhotoList[index]),
              fit: BoxFit.fitWidth,
            )),
      );
    }
  }

  void _goToCamera(BuildContext context, PhotoType type) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraScreen()),
    );
    setState(() {
      if (type == PhotoType.LICENSE) {
        _licensePhotoList.add(result);
        _licenseCount++;
      } else {
        _carPhotoList.add(result);
        _carCount++;
      }
    });
    debugPrint("Returned: $result");
  }
}

enum PhotoType { LICENSE, CAR }
