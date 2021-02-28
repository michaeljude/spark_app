import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/dashboard/home/home_bloc.dart';
import 'package:spark_app/application/dashboard/home/home_state.dart';
import 'package:spark_app/application/dashboard/home/parkfiltering/park_filtering_screen.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_screen.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/utils/constant_enums.dart';
import 'package:spark_app/core/widgets/column_aligned.dart';
import 'package:spark_app/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = "/home";

  HomeScreen() : super();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AnimationController animationController;

  final List<String> images = [
    'https://m.iphoto.net/SMvvc.png',
    'https://m.iphoto.net/SMvvc.png',
    'https://m.iphoto.net/SMvvc.png',
    'https://m.iphoto.net/SMvvc.png',
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (BuildContext context, HomeState state) {},
          builder: (BuildContext context, HomeState state) {
            return Container(
              color: DesignCourseAppTheme.nearlyWhite,
              child: Scaffold(
                backgroundColor: HexColor('#FAFAFA'),
                body: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    getTopBannerUI(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          color: HexColor('#FFFFFF'),
                          child: ColumnAligned(
                            padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                            children: <Widget>[
                              getSparkCreditUI(),
                              getMenuUI(),
                              getBannerUI(),
                              getPromoAdsUI(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget getSparkCreditUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 18, right: 18),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0, left: 0, right: 5),
                child: Container(
                  width: 25,
                  height: 25,
                  child: Image.asset('assets/images/credits_logo.png'),
                ),
              ),
              Text('eCredit',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.2,
                      color: HexColor('#525252'))),
              Spacer(flex: 3),
              Text('PHP 0.00',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.2,
                      color: HexColor('#525252'))),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 8.0),
          child: Divider(
            color: HexColor('#FAFAFA'),
            height: 10,
            thickness: 5,
          ),
        ),
      ],
    );
  }

  Widget getMenuUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 18, right: 18, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                      child: Image.asset(
                        "assets/images/search_destination.png",
                        height: 125,
                      ),
                      onTap: () {
                        _searchdestination(context);
                      }),
                ),
              ],
            )),
        Align(
          alignment: Alignment
              .center, // Align however you like (i.e .centerRight, centerLeft)
          child: Text(
            'Search Destination',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 0.27,
              color: HexColor('#525252'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset(
                          "assets/images/nearby_parking.png",
                          height: 75,
                        ),
                        onTap: () {
                          _goToNearbyParkingScreen(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Nearby Parking',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.27,
                            color: HexColor('#525252'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => _goToFavoriteParkingScreen(context),
                        child: Image.asset(
                          "assets/images/favorite_parking.png",
                          height: 75,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Favorites',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.27,
                            color: HexColor('#525252'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/walk_in_parking.png",
                        height: 75,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Walk-in Parking',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.27,
                            color: HexColor('#525252'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 0, right: 0, bottom: 8.0),
          child: Divider(
            color: HexColor('#FAFAFA'),
            height: 20,
            thickness: 5,
          ),
        ),
      ],
    );
  }

  Widget getBannerUI() {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
        child: CarouselSlider.builder(
          itemCount: images.length,
          options: CarouselOptions(
            height: 110,
            initialPage: 2,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    InkResponse(
                        child:
                            Image.network(images[index], fit: BoxFit.fitWidth)),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget getPromoAdsUI() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 18, right: 18, bottom: 8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'We\'re sure you\'ll like this',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                letterSpacing: 0.27,
                color: DesignCourseAppTheme.darkerText,
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              physics: ScrollPhysics(),
              children: List.generate(4, //this is the total number of cards
                  (index) {
                return Container(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      'assets/images/promo.png',
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.all(5),
                  ),
                );
              }),
            ),
          ]),
    );
  }

  Widget getTopBannerUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Welcome, Sparky!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 0.2,
                    color: DesignCourseAppTheme.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: 0.27,
                      color: DesignCourseAppTheme.darkerText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _searchdestination(BuildContext context,
          {ParkingListResponseModel parking}) =>
      Navigator.of(context).push(SearchDestinationScreen.route(
          origin: Origin.SEARCH_DIRECTION, parking: parking));

  void _goToNearbyParkingScreen(BuildContext context) async {
    var result = await Navigator.of(context)
        .push(ParkFilteringScreen.route(FilteringType.nearby.type));

    if (result != null && result is ParkingListResponseModel) {
      _searchdestination(context, parking: result);
    }
  }

  void _goToFavoriteParkingScreen(BuildContext context) async {
    var result = await Navigator.of(context)
        .push(ParkFilteringScreen.route(FilteringType.favorite.type));

    if (result != null && result is ParkingListResponseModel) {
      _searchdestination(context, parking: result);
    }
  }
}
