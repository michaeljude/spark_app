import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:spark_app/application/dashboard/home/payment_details/feedback/feedback_screen.dart';
import 'package:spark_app/application/dashboard/home/payment_details/transactiondetails/transaction_details_bloc.dart';
import 'package:spark_app/application/dashboard/home/payment_details/transactiondetails/transaction_details_state.dart';
import 'package:spark_app/application/dashboard/model/user_status_model.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/widgets/aligned_padding.dart';
import 'package:spark_app/core/widgets/row_aligned.dart';
import 'package:spark_app/core/widgets/spark_scaffold.dart';
import 'package:spark_app/core/widgets/spark_text.dart';
import 'package:spark_app/theme/app_theme.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final String bookedTime;
  final String serverTime;
  final ParkingListResponseModel parkingList;
  final String paymentMethod;
  final String customerId;

  TransactionDetailsScreen(
      {this.customerId,
      this.bookedTime,
      this.serverTime,
      this.parkingList,
      this.paymentMethod});

  static Route<dynamic> route(
      {String bookedTime,
      String serverTime,
      ParkingListResponseModel parkingList,
      String paymentMethod,
      String customerId}) {
    return MaterialPageRoute(
        builder: (BuildContext context) => TransactionDetailsScreen(
              bookedTime: bookedTime,
              serverTime: serverTime,
              parkingList: parkingList,
              paymentMethod: paymentMethod,
              customerId: customerId,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionDetailsBloc, TransactionDetailsState>(
      listener: (context, state) {
        if(state is TransactionDetailsOnShowFeedbackScreen) {
          Navigator.of(context).pushAndRemoveUntil(FeedbackScreen.route(
            bookedTime: this.bookedTime,
            serverTime: this.serverTime,
            parkingList: this.parkingList,
            paymentMethod: this.paymentMethod
          ), (route) => false);
        }
      },
      child: SparkScaffold(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onLeadingIconFunction: () => Navigator.of(context).pop(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AlignedPadding(
                    alignment: Alignment.topCenter,
                    edgeInsets: const EdgeInsets.all(0),
                    child: QrImage(
                      data:
                          "{'customerID': $customerId, 'transactionID': ${UserStatusModel.instance().transactionId}}",
                      version: QrVersions.auto,
                      size: 200.0,
                    )),
                AlignedPadding(
                  alignment: Alignment.center,
                  edgeInsets:
                      const EdgeInsets.only(top: 12, left: 21, right: 40),
                  child: SparkText(
                    fontWeight: FontWeight.bold,
                    text: "${this.parkingList.parkingName}",
                  ),
                ),
                AlignedPadding(
                  alignment: Alignment.center,
                  edgeInsets: const EdgeInsets.only(
                      top: 4, bottom: 21, left: 21, right: 40),
                  child: SparkText(
                    text:
                        "${this.parkingList.parkingStreet} ${this.parkingList.parkingBarangay} ${this.parkingList.parkingMunicipal} ${this.parkingList.parkingProvince}",
                  ),
                ),
                AlignedPadding(
                  edgeInsets: const EdgeInsets.only(
                      top: 4, bottom: 14, left: 21, right: 21),
                  child: SparkText(
                    text: "Transaction Details",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RowAligned(
                  padding: const EdgeInsets.only(top: 4, left: 21, right: 21),
                  children: <Widget>[
                    Expanded(
                        child: SparkText(
                      text: "Parking Fee",
                      size: 14,
                      color: HexColor("#707070"),
                    )),
                    SparkText(
                      text: "₱${this.parkingList.parkingFlatrate}",
                      color: HexColor("#117E96"),
                    )
                  ],
                ),
                RowAligned(
                  padding: const EdgeInsets.only(top: 4, left: 21, right: 21),
                  children: <Widget>[
                    Expanded(
                        child: SparkText(
                      text: "Exceeding Rate",
                      size: 14,
                      color: HexColor("#707070"),
                    )),
                    SparkText(
                      text: "+ ₱${this.parkingList.parkingExceeding}",
                      color: HexColor("#FF0000"),
                    )
                  ],
                ),
                RowAligned(
                  padding: const EdgeInsets.only(top: 4, left: 21, right: 21),
                  children: <Widget>[
                    Expanded(
                        child: SparkText(
                      text: "Duration",
                      size: 14,
                      color: HexColor("#707070"),
                    )),
                    SparkText(
                      text: "2 hours",
                      color: HexColor("#525252"),
                    )
                  ],
                ),
                RowAligned(
                  padding: const EdgeInsets.only(top: 4, left: 21, right: 21),
                  children: <Widget>[
                    Expanded(
                        child: SparkText(
                      text: "Date & Time",
                      size: 14,
                      color: HexColor("#707070"),
                    )),
                    SparkText(
                      text: _getDate(),
                      color: HexColor("#525252"),
                    )
                  ],
                ),
                RowAligned(
                  padding: const EdgeInsets.only(top: 4, left: 21, right: 21),
                  children: <Widget>[
                    Expanded(
                      child: Text(""),
                    ),
                    SparkText(
                      text: _getTime(),
                      color: HexColor("#525252"),
                    )
                  ],
                ),
                RowAligned(
                  padding: const EdgeInsets.only(top: 4, left: 21, right: 21),
                  children: <Widget>[
                    Expanded(
                        child: SparkText(
                      text: "Payment Mode",
                      size: 14,
                      color: HexColor("#707070"),
                    )),
                    SparkText(
                      text: paymentMethod,
                      color: HexColor("#525252"),
                    )
                  ],
                ),
                RowAligned(
                  padding: const EdgeInsets.only(
                      top: 18, bottom: 12, left: 21, right: 21),
                  children: <Widget>[
                    Expanded(
                        child: SparkText(
                      text: "TOTAL",
                      size: 18,
                      fontWeight: FontWeight.bold,
                      color: HexColor("#707070"),
                    )),
                    SparkText(
                      text: "₱ ${this.parkingList.parkingFlatrate}",
                      color: HexColor("#525252"),
                      size: 18,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }

  String _getDate() {
    DateTime bTime = DateFormat("yyyy-mm-dd hh:mm a").parse(this.bookedTime);
    DateTime sTime = DateFormat("yyyy-mm-dd hh:mm a").parse(this.serverTime);

    String bookedDay = DateFormat("EEE").format(bTime);
    String serverDay = DateFormat("EEE").format(sTime);

    String bookedMonth = DateFormat("MMM").format(bTime);
    String serverMonth = DateFormat("MMM").format(sTime);

    String bookedDate = "$bookedDay ${bTime.day} $bookedMonth";
    String serverDate = "$serverDay ${sTime.day} $serverMonth";
    String date = bookedDate;
    if (bookedDate != serverDate) {
      date = "$bookedDate - $serverDate";
    }

    return "$date";
  }

  String _getTime() {
    DateTime bTime = DateFormat("yyyy-mm-dd hh:mm a").parse(this.bookedTime);
    DateTime sTime = DateFormat("yyyy-mm-dd hh:mm a").parse(this.serverTime);

    String bookedTime = DateFormat("h:mm a").format(bTime);
    String serverTime = DateFormat("h:mm a").format(sTime);

    String time = "$bookedTime - $serverTime";

    return "$time";
  }
}
