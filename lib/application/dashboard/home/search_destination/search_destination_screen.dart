import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:spark_app/application/dashboard/home/payment_details/payment_details_screen.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_bloc.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_event.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_state.dart';
import 'package:spark_app/application/dashboard/home/search_destination/searchlocation/search_location_modal.dart';
import 'package:spark_app/application/dashboard/model/user_status_model.dart';
import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/repository/dashboardrepository/searchdestinationrepository/search_destination_repository.dart';
import 'package:spark_app/core/utils/constant_enums.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
import 'package:spark_app/core/widgets/column_aligned.dart';
import 'package:spark_app/core/widgets/payment_details.dart';
import 'package:spark_app/core/widgets/row_aligned.dart';
import 'package:spark_app/core/widgets/spark_text.dart';
import 'package:spark_app/core/widgets/spark_text_field.dart';
import 'package:spark_app/theme/app_theme.dart';

class SearchDestinationScreen extends StatefulWidget {
  SearchDestinationScreen({this.origin, this.initialParkingSearched});

  static final String routeName = "/search_destination";

  static Route<dynamic> route(
          {Origin origin, ParkingListResponseModel parking}) =>
      MaterialPageRoute(
          builder: (context) => SearchDestinationScreen(
                origin: origin,
                initialParkingSearched: parking,
              ));

  final Origin origin;
  final ParkingListResponseModel initialParkingSearched;

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

  bool isSearchBarVisible = false;
  TextEditingController _searchController;

  // Object for PolylinePoints
  PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};

  ProgressDialog _progressDialog;

  BuildContext _context;

  //BottomSheet
  ParkingListResponseModel _parkingList;
  ParkingListResponseModel _initialSearchedParking;
  GlobalKey<ExpandableBottomSheetState> key = new GlobalKey();
  bool _isVisible = false;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();

    if (widget.origin != null && widget.origin == Origin.SEARCH_DIRECTION) {
      isSearchBarVisible = true;
      _searchController = TextEditingController();
    }

    _initialSearchedParking = widget.initialParkingSearched;

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

    if (_initialSearchedParking == null) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(position.latitude, position.longitude), zoom: 15),
        ),
      );
    } else {
      _goToInitialSearchedParking();
    }

    // _location.onLocationChanged.listen((l) {
    //   _controller.animateCamera(
    //     CameraUpdate.newCameraPosition(
    //       CameraPosition(target: LatLng(position.latitude, position.longitude),zoom: 15),
    //     ),
    //   );
    // });
  }

  void _goToInitialSearchedParking() async {
    if (_initialSearchedParking != null) {
      LatLng latlng = LatLng(widget.initialParkingSearched.latitude,
          widget.initialParkingSearched.longitude);
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(latlng.latitude, latlng.longitude), zoom: 15),
        ),
      );

      _searchController.text =
          "${_initialSearchedParking.parkingStreet} ${_initialSearchedParking.parkingBarangay} ${_initialSearchedParking.parkingMunicipal} ${_initialSearchedParking.parkingProvince}";
    }
    _initialSearchedParking = null;
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
                if (model.parkingType == ParkingType.spark.type) {
                  if (UserStatusModel.instance().status ==
                          BookingStatus.BOOKED ||
                      UserStatusModel.instance().status ==
                              BookingStatus.PARKED &&
                          UserStatusModel.instance().parkingName ==
                              model.parkingName) {
                    _goToPaymentDetails(context, model);
                    debugPrint("Opening Payment Details Screen");
                  }
                }
              }),
          onTap: () {
            if (model.parkingType == ParkingType.spark.type) {
              _selectedPosition = Position(
                  longitude: model.longitude, latitude: model.latitude);
              _parkingList = model;
              if (UserStatusModel.instance().status == BookingStatus.FREE) {
                key.currentState.expand();
                _isVisible = true;
                context
                    .bloc<SearchDestinationBloc>()
                    .add(OnShowBottomSheetEvent());
              }
            }
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
    parkingList.forEach((element) async {
      BitmapDescriptor marker = await _getCustomMarker(element.parkingType);
      markerMap.putIfAbsent(
          element.parkingName, () => _getMarker(context, element, marker));
    });
    debugPrint("");
  }

  Future<BitmapDescriptor> _getCustomMarker(String type) async {
    final ImageConfiguration config = createLocalImageConfiguration(context);

    String markerPin;
    if (type == ParkingType.spark.type) {
      markerPin = 'assets/images/spark_marker.png';
    } else {
      markerPin = 'assets/images/non_spark_marker.png';
    }

    BitmapDescriptor marker =
        await BitmapDescriptor.fromAssetImage(config, markerPin);
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
            } else {
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
          return SafeArea(
            child: ExpandableBottomSheet(
              key: this.key,
              expandableContent: _bottomSheetContainer(_parkingList),
              background: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      polylines: Set<Polyline>.of(polylines.values),
                      initialCameraPosition:
                          CameraPosition(target: _initialcameraposition),
                      markers: this.markerMap.values.toSet(),
                      mapType: MapType.normal,
                      onMapCreated: _onMapCreated,
                      myLocationButtonEnabled: false,
                    ),
                    _searchBar(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _searchLocationField() async {
    var place =
        await Navigator.of(this._context).push(SearchLocationModal.route());
    if (place != null) {
      Geolocation geolocation = await place.geolocation;
      _controller.animateCamera(
          CameraUpdate.newLatLngZoom(geolocation.coordinates, -100.0));
      _controller
          .animateCamera(CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
      if (place is Place) {
        _searchController.text = place.description;
      }
    }
  }

  Widget _searchBar(BuildContext context) => Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SizedBox.fromSize(
          size: Size(double.infinity, MediaQuery.of(context).size.height * .25),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                  color: Colors.white),
              child: ColumnAligned(
                padding: const EdgeInsets.all(10),
                children: <Widget>[
                  RowAligned(
                    padding:
                        const EdgeInsets.only(top: 10, left: 14, right: 14),
                    children: <Widget>[
                      Expanded(
                        child: SparkTextField(
                          placeholder: "Enter Coupon",
                        ),
                      ),
                      SizedBox(
                        width: 12,
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("#1B7E96")),
                        child: IconButton(
                            icon: Icon(Icons.shop_two, color: Colors.white),
                            onPressed: null),
                      )
                    ],
                  ),
                  Spacer(),
                  RowAligned(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 14, right: 14),
                    children: <Widget>[
                      Expanded(
                        child: SparkTextField(
                          controller: _searchController,
                          placeholder: "I'm going to",
                          onTap: () => _searchLocationField(),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ));

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
      debugPrint("DIRECTION ERROR: $e");
      showErrorsDialog("Something wbaent wrong!");
    }
  }
}
