import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/dashboard/home/nearbyparkings/bloc/nearby_parking_bloc.dart';
import 'package:spark_app/application/dashboard/home/nearbyparkings/bloc/nearby_parking_state.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/widgets/column_aligned.dart';
import 'package:spark_app/core/widgets/spark_parking_container.dart';
import 'package:spark_app/core/widgets/spark_scaffold.dart';
import 'package:spark_app/core/widgets/spark_text.dart';

class NearbyParkingScreen extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => NearbyParkingScreen());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NearbyParkingBloc>(
      create: (BuildContext context) => NearbyParkingBloc(),
      child: NearbyParkingView(),
    );
  }
}

class NearbyParkingView extends StatefulWidget {
  @override
  _NearbyParkingViewState createState() => _NearbyParkingViewState();
}

class _NearbyParkingViewState extends State<NearbyParkingView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NearbyParkingBloc, NearbyParkingState>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        if (state is InitialNearbyParkingState) {
          context.bloc<NearbyParkingBloc>().getParkingList();
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
                      text: 'Nearby Parking',
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10),
                Expanded(child: _buildNearbyParkingList(context))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNearbyParkingList(BuildContext context) => FutureBuilder(
      future: context.bloc<NearbyParkingBloc>().getNearbyParking(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snaphot) {
        if (snaphot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: context.bloc<NearbyParkingBloc>().nearbyParking.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                ParkingListResponseModel parking =
                    context.bloc<NearbyParkingBloc>().nearbyParking[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                  child: SparkParkingContainer(
                    onTap: () {
                      Navigator.of(context).pop(parking);
                    },
                    parkingName: context
                        .bloc<NearbyParkingBloc>()
                        .nearbyParking[index]
                        .parkingName,
                    parkingAddress:
                        "${parking.parkingStreet} ${parking.parkingBarangay} ${parking.parkingMunicipal} ${parking.parkingProvince}",
                  ),
                );
              });
        }
      });
}
