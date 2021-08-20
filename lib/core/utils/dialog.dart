import 'package:flutter/material.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
import 'package:spark_app/core/widgets/column_aligned.dart';
import 'package:spark_app/core/widgets/spark_text.dart';
import 'package:spark_app/theme/app_theme.dart';

class DialogUtils {
  static void showErrorsDialog(BuildContext context, String title) =>
      showDialog(
          context: context,
          builder: (BuildContext context) => Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.width * .7,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: ColumnAligned(
                        padding: const EdgeInsets.all(10),
                        children: <Widget>[
                          SparkText(
                              text: title,
                              textAlign: TextAlign.center,
                              size: 24,
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SparkButton(
                                  color: Colors.green,
                                  buttonText: "Okay",
                                  textcolor: HexColor('#ffffff'),
                                  action: () => Navigator.of(context).pop()),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                ),
              ));
}
