import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class BaseWidgets {

  final BuildContext _context;

  ProgressDialog _progressDialog;

  BaseWidgets(this._context);

  factory BaseWidgets.instance(context) {
      return BaseWidgets(context);
  }

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