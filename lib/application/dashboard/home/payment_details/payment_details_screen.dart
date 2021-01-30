import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spark_app/application/dashboard/home/payment_details/payment_details_bloc.dart';
import 'package:spark_app/application/dashboard/home/payment_details/payment_details_event.dart';
import 'package:spark_app/application/dashboard/home/payment_details/payment_details_state.dart';
import 'package:spark_app/application/dashboard/home/payment_details/transactiondetails/transaction_details_screen.dart';
import 'package:spark_app/application/dashboard/model/user_status_model.dart';
import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/repository/dashboardrepository/searchdestinationrepository/search_destination_repository.dart';
import 'package:spark_app/core/utils/base_widgets.dart';
import 'package:spark_app/core/utils/constant_enums.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
import 'package:spark_app/core/widgets/payment_details.dart';
import 'package:spark_app/core/widgets/row_aligned.dart';
import 'package:spark_app/core/widgets/spark_scaffold.dart';
import 'package:spark_app/theme/app_theme.dart';

class PaymentDetailsScreen extends StatefulWidget {
  static Route<dynamic> route(ParkingListResponseModel parkingListModel) {
    return MaterialPageRoute(
        builder: (BuildContext context) =>
            PaymentDetailsScreen(parkingListModel));
  }

  final ParkingListResponseModel parkingList;

  PaymentDetailsScreen(this.parkingList);

  @override
  State<StatefulWidget> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  ApiService _apiService;
  BaseWidgets _baseWidgets;

  @override
  void initState() {
    super.initState();

    _baseWidgets = Provider.of<BaseWidgets>(context, listen: false);
    _apiService = Provider.of<ApiService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentDetailsBloc>(
        create: (BuildContext context) =>
            PaymentDetailsBloc(SearchDestinationRepository(_apiService)),
        child: BlocConsumer<PaymentDetailsBloc, PaymentDetailsState>(
            builder: (context, state) {
          return SparkScaffold(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onLeadingIconFunction: () => Navigator.of(context).pop(),
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                PaymentDetails(
                  widget.parkingList,
                  Origin.INFO_WINDOW,
                  () {
                    context
                        .bloc<PaymentDetailsBloc>()
                        .add(SetUserAsParkedEvent());
                  },
                  bookingStatus: UserStatusModel.instance().status,
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RowAligned(
                      padding: const EdgeInsets.only(bottom: 25),
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.black.withOpacity(0.1))),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 18.0),
                              child: SparkButton(
                                  color: HexColor("#117E96"),
                                  buttonText: "Cancel Booking",
                                  action: () {}),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.black.withOpacity(0.1))),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 18.0),
                              child: SparkButton(
                                  isEnabled:
                                      UserStatusModel.instance().status ==
                                          BookingStatus.PARKED,
                                  color: HexColor("#19BA19"),
                                  buttonText: "Payment",
                                  action: () {
                                    context
                                        .bloc<PaymentDetailsBloc>()
                                        .add(GetTransactionDetailsEvent());
                                  }),
                            ),
                          ),
                        )
                      ]),
                ))
              ],
            ),
          );
        }, listener: (context, state) {
          if (state.runtimeType == ShowLoadingState) {
            _baseWidgets.showLoading();
          } else if (state.runtimeType == HideLoadingState) {
            _baseWidgets.hideLoading();
          }
          if (state.runtimeType == SuccessfullyParkedState) {}
          if (state.runtimeType == FailedParkedState) {}
          if (state is SuccessfulGetTransactionDetails) {
            Navigator.of(context).push(TransactionDetailsScreen.route(
                customerId: state.customerId,
                bookedTime: state.bookedTime,
                serverTime: state.serverTime,
                parkingList: widget.parkingList,
                paymentMethod: "Cash"));
          }
          if (state.runtimeType == FailedGetTransactionDetails) {}
        }));
  }
}
