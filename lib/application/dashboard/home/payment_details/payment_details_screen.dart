import 'package:flutter/material.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/utils/constant_enums.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
import 'package:spark_app/core/widgets/payment_details.dart';
import 'package:spark_app/core/widgets/row_aligned.dart';
import 'package:spark_app/theme/app_theme.dart';

class PaymentDetailsScreen extends StatefulWidget {
  static Route<dynamic> route(ParkingListResponseModel parkingListModel) {
    return MaterialPageRoute(
        builder: (BuildContext context) =>
            PaymentDetailsScreen(parkingListModel));
  }

  ParkingListResponseModel parkingList;

  PaymentDetailsScreen(this.parkingList);

  @override
  State<StatefulWidget> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          tooltip: "BackButton",
        ),
      ),
      body: Column(
        children: <Widget>[
          PaymentDetails(widget.parkingList, Origin.INFO_WINDOW, () {}),
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
                          top: BorderSide(color: Colors.black.withOpacity(0.1))),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 18.0),
                        child: SparkButton(
                            color: HexColor("#19BA19"),
                            buttonText: "Payment",
                            action: () {}),
                      ),
                    ),
                  )
                ]),
          ))
        ],
      ),
    );
  }
}
