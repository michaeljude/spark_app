import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:spark_app/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {

  static final String routeName = "/home";

  final String text;

  HomeScreen({this.text}) : super();

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: HexColor('#FAFAFA'),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: HexColor('#FFFFFF'),
                  child: Column(
                    children: <Widget>[
                      getCategoryUI(),
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
  }

  Widget getCategoryUI() {
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
                            width:25,
                            height: 25,
                            child: Image.asset('assets/images/credits_logo.png'),
                        ),
                  ),
                  Text('eCredit',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 0.2,
                          color: HexColor('#525252')
                      )
                  ),
                  Spacer(), // Defaults to a flex of one.
                  Spacer(flex: 2),
                  Text('PHP 400.00',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 0.2,
                          color: HexColor('#525252')
                      )
                  ),
              ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 8.0),
          child : Divider(
          color: HexColor('#FAFAFA'),
          height: 10,
          thickness: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 18, right: 18, bottom: 20),
            child :Row(
              mainAxisAlignment : MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/images/search_destination.png",
                    height: 125,
                  ),
                ),
              ],
            )
        ),
        Align(
          alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
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
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 5, left: 18, right: 18, bottom: 0),
                  child :Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/nearby_parking.png",
                          height: 75,
                        ),
                      ),
                    ],
                  )
              ),

              const SizedBox(
                width: 16,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 5, left: 18, right: 18, bottom: 0),
                  child :Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/favorite_parking.png",
                          height: 75,
                        ),
                      ),
                    ],
                  )
              ),
              const SizedBox(
                width: 16,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 5, left: 18, right: 0, bottom: 0),
                  child :Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/walk_in_parking.png",
                          height: 75,
                        ),
                      ),

                    ],
                  )
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 18, right: 18),
          child: Row(
            children: <Widget>[
          Text(
            'Nearby Parking',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 0.27,
              color: HexColor('#525252'),
            ),
          ),
              Spacer(),
              Text(
                'Favorites',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.27,
                  color: HexColor('#525252'),
                ),
              ),
              Spacer(),
              Text(
                'Walk-in Parking',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.27,
                  color: HexColor('#525252'),
                ),
              ),
            ],
        ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 30, left: 0, right: 0, bottom: 8.0),
            child : Divider(
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
            height: 120,
            initialPage: 2,
            viewportFraction: 1.0,

          ),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(children: <Widget>[
                  InkResponse(
                  child: Image.network(images[index], fit: BoxFit.fitWidth)
              ),
            ],

            ),
              ),
            );
          },
        )
    );
  }


  Widget getPromoAdsUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
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

            children: List.generate(
                8,//this is the total number of cards
                    (index){
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
                      elevation: 5,
                      margin: EdgeInsets.all(5),
                    ),
                  );
                }


      ),
      ),
          ]

      ),

    );

  }

  Widget getAppBarUI() {
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
                  'Welcome, Ceej!',
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
                child : Text(
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
}




