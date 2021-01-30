import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:spark_app/application/dashboard/home/payment_details/payment_details_screen.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_bloc.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_event.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_state.dart';
import 'package:spark_app/application/dashboard/model/user_status_model.dart';
import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/repository/dashboardrepository/searchdestinationrepository/search_destination_repository.dart';
import 'package:spark_app/core/utils/constant_enums.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
import 'package:spark_app/core/widgets/column_aligned.dart';
import 'package:spark_app/core/widgets/payment_details.dart';
import 'package:spark_app/core/widgets/spark_text.dart';
import 'package:spark_app/theme/app_theme.dart';

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
  Position _selectedPosition;
  SearchDestinationBloc _bloc;
  Map<String, Marker> markerMap;
  ApiService _apiService;

  // Object for PolylinePoints
  PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};

  ProgressDialog _progressDialog;

  BuildContext _context;

  //BottomSheet
  ParkingListResponseModel _parkingList;
  GlobalKey<ExpandableBottomSheetState> key = new GlobalKey();
  bool _isVisible = false;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();

    setProgressDialog();
    _apiService = Provider.of<ApiService>(context, listen: false);

    this.markerMap = Map<String, Marker>();
    _parkingList = ParkingListResponseModel(
        message: "",
        parkingId: 0,
        ownerParkingId: 0,
        parkingName: "",
        parkingFlatrate: 0,
        parkingDuration: 0,
        parkingExceeding: 0,
        parkingStreet: "",
        parkingBarangay: "",
        parkingMunicipal: "",
        parkingProvince: "",
        parkingCountry: "",
        latitude: 0,
        longitude: 0);
  }

  void setProgressDialog() {
    _progressDialog = ProgressDialog(this.context,
        type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);
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

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 15),
      ),
    );
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

  Marker _getCurrentPosition(BitmapDescriptor userMarker) => Marker(
        markerId: MarkerId("Current Location"),
        position: LatLng(position.latitude, position.longitude),
        icon: userMarker,
        infoWindow: InfoWindow(
          title: "My Location",
        ),
      );

  Marker _getMarker(BuildContext context, ParkingListResponseModel model,
          BitmapDescriptor marker) =>
      Marker(
          markerId: MarkerId(model.parkingId.toString()),
          position: LatLng(model.latitude, model.longitude),
          icon: marker,
          infoWindow: InfoWindow(
              title: model.parkingName,
              onTap: () {
                _goToPaymentDetails(context, model);
                debugPrint("Opening Payment Details Screen");
              }),
          onTap: () {
            _selectedPosition =
                Position(longitude: model.longitude, latitude: model.latitude);
            _parkingList = model;
            key.currentState.expand();
            _isVisible = true;
            context.bloc<SearchDestinationBloc>().add(OnShowBottomSheetEvent());
          });

  void _goToPaymentDetails(
          BuildContext context, ParkingListResponseModel parkingListModel) =>
      Navigator.of(context).push(PaymentDetailsScreen.route(parkingListModel));

  Widget _bottomSheetContainer(ParkingListResponseModel parkingList) =>
      Visibility(
          visible: _isVisible,
          child: PaymentDetails(parkingList, Origin.SEARCH_DIRECTION, () {
            if (UserStatusModel.instance().status == BookingStatus.FREE) {
              _progressDialog.show();
              _context
                  .bloc<SearchDestinationBloc>()
                  .add(OnBookEvent(parkingListResponseModel: parkingList));
            } else {
              showErrorsDialog("You are already booked/parked");
            }
          }));

  void showErrorsDialog(String title) => showDialog(
      context: context,
      builder: (BuildContext context) => Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width * .9,
              child: Container(
                  color: Colors.white,
                  child: ColumnAligned(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      SparkText(
                          text: title, size: 30, fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 20,
                      ),
                      SparkButton(
                          color: Colors.green,
                          buttonText: "Okay",
                          action: () => Navigator.of(context).pop())
                    ],
                  )),
            ),
          ));

  void _getParkingArea(
      List<ParkingListResponseModel> parkingList, BuildContext context) async {
    BitmapDescriptor marker = await _getCustomMarker();
    parkingList.forEach((element) {
      markerMap.putIfAbsent(
          element.parkingName, () => _getMarker(context, element, marker));
    });
    debugPrint("");
  }

  Future<BitmapDescriptor> _getCustomMarker() async {
    final ImageConfiguration config = createLocalImageConfiguration(context);
    BitmapDescriptor marker = await BitmapDescriptor.fromAssetImage(
        config, "assets/images/spark_marker.png");
    return marker;
  }

  Future<BitmapDescriptor> _getUserCustomMarker() async {
    final ImageConfiguration config = createLocalImageConfiguration(context);
    BitmapDescriptor marker = await BitmapDescriptor.fromAssetImage(
        config, "assets/images/user_marker.png");
    return marker;
  }

  void setUserMarker() async {
    BitmapDescriptor carMarker = await _getUserCustomMarker();
    Marker marker = _getCurrentPosition(carMarker);
    this.markerMap.putIfAbsent("MyLocation", () => marker);
  }

  Widget mapWidget() {
    setUserMarker();
    return BlocProvider<SearchDestinationBloc>(
      create: (BuildContext context) =>
          SearchDestinationBloc(SearchDestinationRepository(_apiService)),
      child: BlocConsumer<SearchDestinationBloc, SearchDestinationState>(
        listener: (BuildContext context, SearchDestinationState state) {
          if (state is AddParkingMarker) {
            _getParkingArea(state.parkingList, context);
            if (UserStatusModel.instance().status == BookingStatus.BOOKED) {
              _createPolylines(position, UserStatusModel.instance().position);
            }
            else {
              _progressDialog.hide();
            }
            debugPrint("PARKING_LIST: ${state.parkingList.toString()}");
          }
          if (state.runtimeType == SearchDestinationLoadingState) {
            _progressDialog.show();
          }
          if (state.runtimeType == SearchDestinationHideLoadingState) {
            _progressDialog.hide();
          }
          if (state.runtimeType == OnGetParkingListFailedState) {
            _progressDialog.hide();
            showErrorsDialog("Something went wrong!");
          }
          if (state.runtimeType == OnDrawRouteState) {
            _progressDialog.hide();
            key.currentState.contract();
          }
          if (state.runtimeType == OnBookingFailed) {
            _progressDialog.hide();
          }
          if (state.runtimeType == OnBookingSuccess) {
            _createPolylines(position, _selectedPosition);
          }
        },
        builder: (BuildContext context, SearchDestinationState state) {
          _context = context;
          if (state.runtimeType == SearchDestinationInitialState) {
            context
                .bloc<SearchDestinationBloc>()
                .add(SearchDestinationGetParking());
          }
          return ExpandableBottomSheet(
            key: this.key,
            expandableContent: _bottomSheetContainer(_parkingList),
            background: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(children: [GoogleMap(
                    polylines: Set<Polyline>.of(polylines.values),
                    initialCameraPosition:
                        CameraPosition(target: _initialcameraposition),
                    markers: this.markerMap.values.toSet(),
                    mapType: MapType.normal,
                    onMapCreated: _onMapCreated,
                    myLocationButtonEnabled: false,
                  ),],),
            ),
          );
        },
      ),
    );
  }

  _createPolylines(Position start, Position destination) async {
    // Initializing PolylinePoints
    try {
      polylinePoints = PolylinePoints();

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyAmjWnnt1d36tZdhYU9oVuYeukG64uquew", // Google Maps API Key
        PointLatLng(start.latitude, start.longitude),
        PointLatLng(destination.latitude, destination.longitude),
        travelMode: TravelMode.driving,
      );

      polylineCoordinates.clear();
      // Adding the coordinates to the list
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }
      PolylineId id = PolylineId('poly');

      // Initializing Polyline
      Polyline polyline = Polyline(
        polylineId: id,
        color: HexColor("#118098"),
        points: polylineCoordinates,
        width: 8,
      );

      // Adding the polyline to the map
      polylines.clear();
      polylines[id] = polyline;
      debugPrint(polylines.toString());
      _context.bloc<SearchDestinationBloc>().add(OnDrawRouteEvent());
    } catch (e) {
      _progressDialog.hide();
      showErrorsDialog("Something went wrong!");
    }
  }
}
