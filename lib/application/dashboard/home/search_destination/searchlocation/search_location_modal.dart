import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:spark_app/core/widgets/spark_scaffold.dart';
import 'package:spark_app/core/widgets/spark_text.dart';

class SearchLocationModal extends StatefulWidget {
  static final String routeName = "/search-location-modal";

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) {
      return SearchLocationModal();
    });
  }

  @override
  State<StatefulWidget> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocationModal> {
  @override
  Widget build(BuildContext context) {
    return SparkScaffold(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onLeadingIconFunction: () => Navigator.of(context).pop(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        color: Colors.grey,
        child: Column(
          children: <Widget>[_searchField()],
        ),
      )),
    );
  }

  Widget _searchField() => Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 24),
                child: SparkText(
                  text: "Enter your destination",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SearchMapPlaceWidget(
                apiKey: "AIzaSyAmjWnnt1d36tZdhYU9oVuYeukG64uquew",
                hasClearButton: true,
                icon: Icons.location_on_outlined,
                iconColor: Colors.grey,
                placeType: PlaceType.address,
                location: LatLng(14.599512, 20.984222),
                radius: 300000,
                placeholder: "Enter address",
                onSelected: (Place place) async {
                  Navigator.of(context).pop(place);
                },
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      );
}
