import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:spark_app/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
class WalkInParkingScreen extends StatefulWidget {
  static final String routeName = "/walkin_parking";
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<WalkInParkingScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;

  String _qrValidation;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#ffffff'),
        elevation: 0.0,

        leading: IconButton(
          padding: const EdgeInsets.only(left:0, top: 5),
          icon: Icon(
            FeatherIcons.chevronLeft,
            color: HexColor('#626262'),
            size: 30,
          ),
          onPressed: () {

            Navigator.pop(context);
          },
          tooltip: "BackButton",
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff19BA19),
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text('Scan a code',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: HexColor('#525252')
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      if (await canLaunch(scanData.code)) {
        // await launch(scanData.code);

        Fluttertoast.showToast(
            msg: "Invalid QR Code",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER
        );
        controller.resumeCamera();
       } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Could not find viable url'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Barcode Type: ${describeEnum(scanData.format)}'),
                    Text('Data: ${scanData.code}'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ).then((value) => controller.resumeCamera());
      }
    });
  }
}