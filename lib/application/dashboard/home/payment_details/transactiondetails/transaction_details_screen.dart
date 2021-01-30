import 'package:flutter/material.dart';
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

  TransactionDetailsScreen({this.bookedTime, this.serverTime, this.parkingList});

  static Route<dynamic> route({String bookedTime, String serverTime, ParkingListResponseModel parkingList}) {
    return MaterialPageRoute(
        builder: (BuildContext context) => TransactionDetailsScreen(
              bookedTime: bookedTime,
              serverTime: serverTime,
              parkingList: parkingList,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SparkScaffold(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onLeadingIconFunction: () => Navigator.of(context).pop(),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AlignedPadding(
              alignment: Alignment.centerLeft,
              edgeInsets: const EdgeInsets.only(
                  top: 12, bottom: 21, left: 21, right: 40),
              child: SparkText(
                text:
                    "${this.parkingList.parkingStreet} ${this.parkingList.parkingBarangay} ${this.parkingList.parkingMunicipal} ${this.parkingList.parkingProvince}",
              ),
            ),
            AlignedPadding(
              edgeInsets: const EdgeInsets.only(
                  top: 4, bottom: 14, left: 21, right: 21),
              child: SparkText(
                text: "Parking Details",
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
              padding: const EdgeInsets.only(top: 8, left: 21, right: 21),
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
              padding: const EdgeInsets.only(top: 8, left: 21, right: 21),
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
                  text: "₱ ${this.parkingList.parkingFlatrate * 2}",
                  color: HexColor("#525252"),
                  size: 18,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          ],
        ));
  }
}
