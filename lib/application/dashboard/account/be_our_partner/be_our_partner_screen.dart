import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:spark_app/theme/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BeOurPartnerScreen extends StatefulWidget {
  static final String routeName = "/be_our_partner";
  @override
  BeOurPartnerState createState() => BeOurPartnerState();
}

class BeOurPartnerState extends State<BeOurPartnerScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('#ffffff'),
            elevation: 0.0,
            centerTitle: true,
            title: Text("Be Our Partner",
              style: TextStyle(

                  color: HexColor('#525252'),
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            leading: IconButton(
              padding: const EdgeInsets.only(left:0, top: 0),
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
      body: WebView(
      initialUrl: 'https://sparkph.net',
    )
      );
  }
}