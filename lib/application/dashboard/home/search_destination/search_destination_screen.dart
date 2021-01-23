import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
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
import 'package:spark_app/core/widgets/aligned_padding.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
import 'package:spark_app/core/widgets/column_aligned.dart';
import 'package:spark_app/core/widgets/row_aligned.dart';
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
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
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
          ),
          onTap: () {
            _selectedPosition =
                Position(longitude: model.longitude, latitude: model.latitude);
            _parkingList = model;
            key.currentState.expand();
            _isVisible = true;
            context.bloc<SearchDestinationBloc>().add(OnShowBottomSheetEvent());
          });

  Widget _bottomSheetContainer(ParkingListResponseModel parkingList) =>
      Visibility(
        visible: _isVisible,
        child: Container(
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
                    text: parkingList.parkingName,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#19BA19"),
                  ),
                ),
                GestureDetector(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 28,
                    ),
                    onTap: () => debugPrint("Favorite tapped")),
              ],
            ),
            AlignedPadding(
              alignment: Alignment.centerLeft,
              edgeInsets: const EdgeInsets.only(
                  top: 12, bottom: 21, left: 21, right: 40),
              child: SparkText(
                text:
                    "${parkingList.parkingStreet} ${parkingList.parkingBarangay} ${parkingList.parkingMunicipal} ${parkingList.parkingProvince}",
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
                  text: "₱${parkingList.parkingFlatrate}",
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
                  text: "+ ₱${parkingList.parkingExceeding}",
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
                  text: "₱ ${parkingList.parkingFlatrate * 2}",
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
                    horizontal:
                        BorderSide(color: Colors.black.withOpacity(0.1))),
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
                            right: BorderSide(
                                color: Colors.black.withOpacity(0.1)),
                            bottom: BorderSide(
                                color: Colors.black.withOpacity(0.1)))),
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
                            bottom: BorderSide(
                                color: Colors.black.withOpacity(0.1)))),
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
            RowAligned(
                padding: const EdgeInsets.only(bottom: 20),
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 12.0),
                      child: SparkButton(
                          color: HexColor("#117E96"),
                          buttonText: "Cancel Booking",
                          action: () {}),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 12.0),
                      child: SparkButton(
                          color: HexColor("#19BA19"),
                          buttonText: "Book Now",
                          action: () {
                            _progressDialog.show();
                            _createPolylines(position, _selectedPosition);
                          }),
                    ),
                  )
                ])
          ]),
        ),
      );

  // Widget _sendAMessage() =>

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
            _progressDialog.hide();
            _getParkingArea(state.parkingList, context);
            debugPrint("PARKING_LIST: ${state.parkingList.toString()}");
          }
          if (state.runtimeType == SearchDestinationLoadingState) {
            _progressDialog.show();
          }
          if (state.runtimeType == SearchDestinationHideLoadingState) {
            _progressDialog.hide();
          }
          if (state.runtimeType == OnDrawRouteState) {
            _progressDialog.hide();
            key.currentState.contract();
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
              child: Stack(
                children: [
                  GoogleMap(
                    polylines: Set<Polyline>.of(polylines.values),
                    initialCameraPosition:
                        CameraPosition(target: _initialcameraposition),
                    markers: this.markerMap.values.toSet(),
                    mapType: MapType.normal,
                    onMapCreated: _onMapCreated,
                    myLocationButtonEnabled: false,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _createPolylines(Position start, Position destination) async {
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAmjWnnt1d36tZdhYU9oVuYeukG64uquew", // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.transit,
    );

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
    polylines[id] = polyline;
    debugPrint(polylines.toString());
    _context.bloc<SearchDestinationBloc>().add(OnDrawRouteEvent());
  }
}
