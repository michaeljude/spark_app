import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/dashboard/home/payment_details/transactiondetails/transaction_details_event.dart';
import 'package:spark_app/application/dashboard/home/payment_details/transactiondetails/transaction_details_state.dart';


class TransactionDetailsBloc extends Bloc<TransactionDetailsEvent, TransactionDetailsState> {
  TransactionDetailsBloc() : super(TransactionDetailsInitialState());

  @override
  Stream<TransactionDetailsState> mapEventToState(TransactionDetailsEvent event) async*{
    if(event is TransactionDetailsOnReceiptReceived) {
      yield TransactionDetailsOnShowFeedbackScreen();
    }
  }

}