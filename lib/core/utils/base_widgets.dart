import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
import 'package:spark_app/core/widgets/column_aligned.dart';
import 'package:spark_app/core/widgets/spark_text.dart';

class BaseWidgets {

  final BuildContext _context;

  ProgressDialog _progressDialog;

  BaseWidgets(this._context);

  factory BaseWidgets.instance(context) {
      return BaseWidgets(context);
  }

  void showErrorsDialog(BuildContext context, String title) => showDialog(
      context: context,
      builder: (BuildContext context) => Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width * .9,
              child: Container(
                  color: Colors.white,
                  child: ColumnAligned(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      SparkText(
                          text: title, size: 30, fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 20,
                      ),
                      SparkButton(
                          color: Colors.green,
                          buttonText: "Okay",
                          action: () => Navigator.of(context).pop())
                    ],
                  )),
            ),
          ));

  void showLoading() {

    if(_progressDialog == null) {
      _progressDialog = ProgressDialog(this._context,
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
   _progressDialog.show();
  }

  void hideLoading() {
    if(_progressDialog == null) {
      _progressDialog = ProgressDialog(this._context,
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
   _progressDialog.hide();
  }

}