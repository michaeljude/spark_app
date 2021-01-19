import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


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

  @override
  void initState() {

    getCurrentLocation();
    super.initState();
  }
  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
      position = res;
      _child = mapWidget();
    });
  }
  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(position.latitude, position.longitude),zoom: 15),
        ),
      );
    });
  }

  Set<Marker> _createMarker(){
    return <Marker>[
      Marker(
        markerId: MarkerId("Current Location"),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: "Current Location",),
      )
    ].toSet();
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: _child,
   );
  }

  Widget mapWidget(){
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(target: _initialcameraposition),
              markers: _createMarker(),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationButtonEnabled: false,
            ),
          ],
        ),

    );

  }


}