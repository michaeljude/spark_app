import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/core/app.dart';

final List<String> mailingList = <String>[
  'michaeljude.jmdr@gmail.com'
];

Future<void> main() async {

  CatcherOptions debugOptions =
    CatcherOptions(SilentReportMode(), <ConsoleHandler>[ConsoleHandler()]);

  Catcher(
    Application(),
    debugConfig: debugOptions,
  );
}
