import 'package:flutter/material.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/utils/constant_enums.dart';
import 'package:spark_app/core/widgets/aligned_padding.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
import 'package:spark_app/core/widgets/column_aligned.dart';
import 'package:spark_app/core/widgets/row_aligned.dart';
import 'package:spark_app/core/widgets/spark_text.dart';
import 'package:spark_app/theme/app_theme.dart';

class PaymentDetails extends StatefulWidget {
  final ParkingListResponseModel parkingList;
  final Function action;
  final Origin origin;

  PaymentDetails(this.parkingList, this.origin, this.action);

  @override
  State<StatefulWidget> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Column(children: <Widget>[
        RowAligned(
          padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
          children: <Widget>[
            Expanded(
              child: SparkText(
                text: widget.parkingList.parkingName,
                fontWeight: FontWeight.bold,
                color: HexColor("#19BA19"),
              ),
            ),
            GestureDetector(
                child: Icon(
                  Icons.favorite_border_outlined,
                  size: 28,
                ),
                onTap: () {
                  //
                }),
          ],
        ),
        AlignedPadding(
          alignment: Alignment.centerLeft,
          edgeInsets:
              const EdgeInsets.only(top: 12, bottom: 21, left: 21, right: 40),
          child: SparkText(
            text:
                "${widget.parkingList.parkingStreet} ${widget.parkingList.parkingBarangay} ${widget.parkingList.parkingMunicipal} ${widget.parkingList.parkingProvince}",
          ),
        ),
        AlignedPadding(
          edgeInsets:
              const EdgeInsets.only(top: 4, bottom: 14, left: 21, right: 21),
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
              text: "₱${widget.parkingList.parkingFlatrate}",
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
              text: "+ ₱${widget.parkingList.parkingExceeding}",
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
          padding:
              const EdgeInsets.only(top: 18, bottom: 12, left: 21, right: 21),
          children: <Widget>[
            Expanded(
                child: SparkText(
              text: "TOTAL",
              size: 18,
              fontWeight: FontWeight.bold,
              color: HexColor("#707070"),
            )),
            SparkText(
              text: "₱ ${widget.parkingList.parkingFlatrate * 2}",
              color: HexColor("#525252"),
              size: 18,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 14.0, left: 21, right: 21),
          decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(color: Colors.black.withOpacity(0.1))),
          ),
          child: RowAligned(
            padding: const EdgeInsets.only(bottom: 12),
            children: <Widget>[
              Expanded(
                  child: SparkText(
                text: "Payment Option",
                size: 14,
                fontWeight: FontWeight.bold,
                color: HexColor("#707070"),
              )),
              SparkText(
                text: "Cash",
                size: 14,
                textDecoration: TextDecoration.underline,
                color: HexColor("#117E96"),
              )
            ],
          ),
        ),
        Row(children: <Widget>[
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.black.withOpacity(0.1)),
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(0.1)))),
                child: ColumnAligned(
                  padding: const EdgeInsets.only(bottom: 10),
                  children: <Widget>[
                    Icon(Icons.chat_bubble_outline_outlined),
                    SparkText(
                      text: "Send a message",
                      size: 12,
                      color: HexColor("#707070"),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(0.1)))),
                padding: const EdgeInsets.only(top: 20),
                child: ColumnAligned(
                  padding: const EdgeInsets.only(bottom: 10),
                  children: <Widget>[
                    Icon(Icons.headset_outlined),
                    SparkText(
                      text: "Contact Support",
                      size: 12,
                      color: HexColor("#707070"),
                    )
                  ],
                )),
          )
        ]),
        _setButton()
      ]),
    );
  }

  Widget _setButton() {
    if (widget.origin == Origin.SEARCH_DIRECTION) {
      return RowAligned(
          padding: const EdgeInsets.only(bottom: 25),
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0),
                child: SparkButton(
                    color: HexColor("#117E96"),
                    buttonText: "Cancel Booking",
                    action: () {}),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 12.0),
                child: SparkButton(
                    color: HexColor("#19BA19"),
                    buttonText: "Book Now",
                    action: () {
                      widget.action();
                    }),
              ),
            )
          ]);
    } else
      return ColumnAligned(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          SizedBox(height: 18),
          SparkButton(
              color: HexColor("#19BA19"), buttonText: "Parked", action: null),
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SparkText(
              text: "Kindly tap the Parked button if you are already arrived.",
              size: 12,
              color: Colors.black54,
              isRequired: true,
              position: Positions.LEFT,
            ),
          )
        ],
      );
  }
}
