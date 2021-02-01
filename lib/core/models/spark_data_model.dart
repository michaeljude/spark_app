class SparkDataModel {

  bool _hasReceivedReceipt = false;

  SparkDataModel();

  bool get hasReceivedReceipt => _hasReceivedReceipt;

  set setHasReceivedReceipt(bool val){
      _hasReceivedReceipt = val;
  }

}