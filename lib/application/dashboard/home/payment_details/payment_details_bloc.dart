import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/dashboard/home/payment_details/payment_details_event.dart';
import 'package:spark_app/application/dashboard/home/payment_details/payment_details_state.dart';
import 'package:spark_app/application/dashboard/model/user_status_model.dart';
import 'package:spark_app/core/repository/dashboardrepository/searchdestinationrepository/search_destination_repository.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';
import 'package:spark_app/core/utils/constant_enums.dart';

class PaymentDetailsBloc
    extends Bloc<PaymentDetailsEvent, PaymentDetailsState> {
  PaymentDetailsBloc(this._repository) : super(PaymentDetailsInitialState());

  SearchDestinationRepository _repository;

  @override
  Stream<PaymentDetailsState> mapEventToState(
      PaymentDetailsEvent event) async* {
    if (event.runtimeType == SetUserAsParkedEvent) {
      yield ShowLoadingState();

      try {
        var customerId = await LocalPersistence.instance().getCurrentUser();
        await _repository.setUserAsParked(UserStatusModel.instance().transactionId, customerId);
        UserStatusModel.instance().status = BookingStatus.PARKED;
        yield SuccessfullyParkedState();
      } on DioError catch (_) {
        yield FailedParkedState();
      } catch (e) {
        yield FailedParkedState();
      }

      yield HideLoadingState();
    }
    if(event.runtimeType == GetTransactionDetailsEvent) {

      yield ShowLoadingState();
      try {
        var customerId = await LocalPersistence.instance().getCurrentUser();
        var result = await _repository.getTransactionDetails(transactionID: UserStatusModel.instance().transactionId);
        yield SuccessfulGetTransactionDetails(
          bookedTime: result.bookedTime,
          serverTime: result.serverTime
        );

      } on DioError catch(_) {
        yield FailedGetTransactionDetails();
      } catch(e) {
        yield FailedGetTransactionDetails();
      }
      yield HideLoadingState();
    }
  }
}
