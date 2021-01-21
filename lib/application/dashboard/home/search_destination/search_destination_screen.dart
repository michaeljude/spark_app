import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_bloc.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_event.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_state.dart';
import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/repository/dashboardrepository/searchdestinationrepository/search_destination_repository.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';


class SearchDestinationScreen extends StatefulWidget {

  static final String routeName = "/search_destination";


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchDestinationScreen> {

  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();
  Widget _child;
  Position position;
  SearchDestinationBloc _bloc;
  Map<String, Marker> markerMap;
  ApiService _apiService;

  ProgressDialog _progressDialog;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();

    setProgressDialog();
    _apiService = Provider.of<ApiService>(context, listen: false);

    this.markerMap = Map<String, Marker>();
  }

  void setProgressDialog() {
    _progressDialog = ProgressDialog(this.context, type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);
    _progressDialog.style(
        message: 'Please wait...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
    );
  }

  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
      position = res;
      _child = mapWidget();
    });
  }

bool first = true;

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(position.latitude, position.longitude),zoom: 15),
        ),
      );
    // if(first) {
    //   context.bloc<SearchDestinationBloc>().add(SearchDestinationGetParking());
    //   BlocProvider.of<SearchDestinationBloc>(context).add(SearchDestinationGetParking());
    //   first = false;
    // }

    // _location.onLocationChanged.listen((l) {
    //   _controller.animateCamera(
    //     CameraUpdate.newCameraPosition(
    //       CameraPosition(target: LatLng(position.latitude, position.longitude),zoom: 15),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _child,
    );
  }

  Marker _getCurrentPosition() => Marker(
        markerId: MarkerId("Current Location"),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: "jude Location",),
      );


  Marker _getMarker(double long, double lat, int parkingId, String parkingName, BitmapDescriptor marker) => Marker(
        markerId: MarkerId(parkingId.toString()),
        position: LatLng(lat, long),
        icon: marker,
        infoWindow: InfoWindow(title: parkingName,),
      );


  void _getParkingArea(List<ParkingListResponseModel> parkingList, BuildContext context) async{

        BitmapDescriptor marker = await _getCustomMarker();
        parkingList.forEach((element) {
          markerMap.putIfAbsent(element.parkingName, () => _getMarker(
            element.longitude, element.latitude, element.parkingId, element.parkingName, marker
          ));
        });
        debugPrint("");
  }

  Future<BitmapDescriptor> _getCustomMarker() async {
      final ImageConfiguration config = createLocalImageConfiguration(context);
      BitmapDescriptor marker = await BitmapDescriptor.fromAssetImage(config, "assets/images/spark_marker.png");
      return marker;
  }

  Widget mapWidget(){

    Marker marker = _getCurrentPosition();
    this.markerMap.putIfAbsent("MyLocation", () => marker);
    return BlocProvider<SearchDestinationBloc>(
          create: (BuildContext context) => SearchDestinationBloc(SearchDestinationRepository(_apiService)),
          child: BlocConsumer<SearchDestinationBloc, SearchDestinationState>(
            listener: (BuildContext context, SearchDestinationState state) {
                  if (state is AddParkingMarker) {
                    _progressDialog.hide();
                    _getParkingArea(state.parkingList, context);
                    debugPrint("PARKING_LIST: ${state.parkingList.toString()}");
                  }
                  if(state.runtimeType == SearchDestinationLoadingState) {
                      _progressDialog.show();
                  }
                  if (state.runtimeType == SearchDestinationHideLoadingState) {
                    _progressDialog.hide();
                  }
            },
            builder: (BuildContext context, SearchDestinationState state) {

                if(state.runtimeType == SearchDestinationInitialState) {
                    context.bloc<SearchDestinationBloc>().add(SearchDestinationGetParking());
                }
                return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        GoogleMap(
                          initialCameraPosition: CameraPosition(target: _initialcameraposition),
                          markers: this.markerMap.values.toSet(),
                          mapType: MapType.normal,
                          onMapCreated: _onMapCreated,
                          myLocationButtonEnabled: false,
                        ),
                      ],
                    ),
              );
            },
          ),
    );

  }

}