import 'package:flutter/material.dart';

import 'package:spark_app/core/utils/constants/app_colors.dart';
import 'package:spark_app/core/widgets/column_aligned.dart';
import 'package:spark_app/core/widgets/spark_text.dart';

class SparkParkingContainer extends StatelessWidget {
  const SparkParkingContainer({
    Key key,
    this.parkingName,
    this.parkingAddress,
    @required this.onTap,
  }) : super(key: key);

  final String parkingName;
  final String parkingAddress;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.borderColor)),
        child: ColumnAligned(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: SparkText(
                text: parkingName,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            SparkText(
              text: parkingAddress,
            ),
          ],
        ),
      ),
    );
  }
}
