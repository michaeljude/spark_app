class PaymentDetailsState {}

class PaymentDetailsInitialState extends PaymentDetailsState{}


class ShowLoadingState extends PaymentDetailsState{}

class HideLoadingState extends PaymentDetailsState{}

class SuccessfullyParkedState extends PaymentDetailsState{}

class FailedParkedState extends PaymentDetailsState{}

class SuccessfulGetTransactionDetails extends PaymentDetailsState{
  String bookedTime;
  String serverTime;
    SuccessfulGetTransactionDetails({
      this.bookedTime,
      this.serverTime
    });
}

class FailedGetTransactionDetails extends PaymentDetailsState{

}