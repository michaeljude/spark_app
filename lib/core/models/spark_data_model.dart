class SparkDataModel {

  bool _isWaitingForReceipt = false;

  SparkDataModel();

  bool get isWaitingForReceipt => _isWaitingForReceipt;

  set setIsWaitingForReceipt(bool val){
      _isWaitingForReceipt = val;
  }

}