import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spark_app/application/dashboard/home/parkfiltering/bloc/park_filtering_bloc.dart';
import 'package:spark_app/application/dashboard/home/parkfiltering/bloc/park_filtering_state.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/utils/constant_enums.dart';
import 'package:spark_app/core/widgets/column_aligned.dart';
import 'package:spark_app/core/widgets/spark_parking_container.dart';
import 'package:spark_app/core/widgets/spark_scaffold.dart';
import 'package:spark_app/core/widgets/spark_text.dart';

class ParkFilteringScreen extends StatelessWidget {
  const ParkFilteringScreen({
    Key key,
    this.filteringType,
  }) : super(key: key);

  static Route<dynamic> route(String filteringType) =>
      MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => ParkFilteringScreen(
                filteringType: filteringType,
              ));

  final String filteringType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ParkFilteringBloc>(
      create: (BuildContext context) => ParkFilteringBloc(),
      child: ParkFilteringView(
        filteringType: filteringType,
      ),
    );
  }
}

class ParkFilteringView extends StatefulWidget {
  const ParkFilteringView({
    Key key,
    this.filteringType,
  }) : super(key: key);

  final String filteringType;

  @override
  _ParkFilteringViewState createState() => _ParkFilteringViewState();
}

class _ParkFilteringViewState extends State<ParkFilteringView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParkFilteringBloc, ParkFilteringState>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        if (state is InitialParkFilteringState) {
          context.bloc<ParkFilteringBloc>().getParkingList();
        }
        return SparkScaffold(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onLeadingIconFunction: () => Navigator.of(context).pop(),
          backgroundColor: Colors.white,
          body: Container(
            color: Colors.white,
            child: ColumnAligned(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: SparkText(
                      text: widget.filteringType == FilteringType.nearby.type
                          ? 'Nearby Parking'
                          : 'Favorites',
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10),
                Expanded(
                    child: widget.filteringType == FilteringType.nearby.type
                        ? _buildNearbyParkingList(context)
                        : _buildFavoriteParkingList(context))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNearbyParkingList(BuildContext context) => FutureBuilder(
      future: context.bloc<ParkFilteringBloc>().getNearbyParking(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snaphot) {
        if (snaphot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return snaphot.data == true
              ? ListView.builder(
                  itemCount:
                      context.bloc<ParkFilteringBloc>().nearbyParking.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    ParkingListResponseModel parking =
                        context.bloc<ParkFilteringBloc>().nearbyParking[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                      child: SparkParkingContainer(
                        onTap: () {
                          Navigator.of(context).pop(parking);
                        },
                        parkingName: context
                            .bloc<ParkFilteringBloc>()
                            .nearbyParking[index]
                            .parkingName,
                        parkingAddress:
                            "${parking.parkingStreet} ${parking.parkingBarangay} ${parking.parkingMunicipal} ${parking.parkingProvince}",
                      ),
                    );
                  })
              : Center(
                  child: SparkText(
                    text: 'No Nearby Parking',
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                );
        }
      });

  Widget _buildFavoriteParkingList(BuildContext context) => FutureBuilder(
      future: context.bloc<ParkFilteringBloc>().getFavoriteParking(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snaphot) {
        if (snaphot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return snaphot.data == true
              ? ListView.builder(
                  itemCount:
                      context.bloc<ParkFilteringBloc>().favoriteParking.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    ParkingListResponseModel parking = context
                        .bloc<ParkFilteringBloc>()
                        .favoriteParking[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                      child: SparkParkingContainer(
                        onTap: () {
                          Navigator.of(context).pop(parking);
                        },
                        parkingName: context
                            .bloc<ParkFilteringBloc>()
                            .favoriteParking[index]
                            .parkingName,
                        parkingAddress:
                            "${parking.parkingStreet} ${parking.parkingBarangay} ${parking.parkingMunicipal} ${parking.parkingProvince}",
                      ),
                    );
                  })
              : Center(
                  child: SparkText(
                    text: 'No Favorite Parking',
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                );
        }
      });
}
