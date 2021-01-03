import 'package:alice/alice.dart';
import 'package:flutter/cupertino.dart';
import 'package:spark_app/core/app.dart';

class ApiService {

  const ApiService(
        this._context
      ): super();

  final BuildContext _context;

  static Alice _alice = globalAlice;


}
