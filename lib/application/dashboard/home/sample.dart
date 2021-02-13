import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SampleViewModel{

  dynamic provider;

  void _loadData(dynamic value) {
      this.provider = value;
  }

}

class DataModel{

  String a;

}

class PageA {

  void didChangeDependencies(BuildContext context) {
    SampleViewModel _sampleViewModel = SampleViewModel();
    _sampleViewModel._loadData(Provider.of(context));
  }

}

class PageM {

  SampleViewModel _sampleViewModel;

  void initState(BuildContext context) {

      Provider<DataModel>.value(value: _sampleViewModel.provider);
      String sample = Provider.of<DataModel>(context).a;

      debugPrint(sample);
  }

}