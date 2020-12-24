import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/app.dart';

final List<String> mailingList = <String>[
  'michaeljude.jmdr@gmail.com'
];

Future<void> main() async {

  CatcherOptions debugOptions =
    CatcherOptions(SilentReportMode(), <ConsoleHandler>[ConsoleHandler()]);

  CatcherOptions releaseOptions =
  CatcherOptions(SilentReportMode(), <EmailAutoHandler>[
    EmailAutoHandler(
        'smtp.gmail.com',
        587,
        'lemuel.castro@globe.com.ph',
        'Globe One X : Error Trace',
        'glmrppjikttsctqi', // App Password for SMTP
        mailingList)
  ]);

  Catcher(
    SparkApp(),
    debugConfig: debugOptions,
    releaseConfig: releaseOptions
  );
}
