import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spark_app/theme/app_theme.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
import 'package:spark_app/application/login/loginoption/login_option_screen.dart';

const COLOR_ACCENT = 0xFFd756ff;
const COLOR_PRIMARY_DARK = 0xFF6900be;
const COLOR_PRIMARY = 0xFFFFFFFF;

final List<String> _titlesList = [
  'Enter your destination',
  'Book your preferred parking.',
  'Drive and Park to your selected Parking Slot'
];
final List<String> _subtitlesList = [
  'Open Spark and input your destination. Your driving buddy will show all the nearby parking to where you are heading.',
  'Choose from the list of available Spark parking and reserve it by paying ahead of time. If it is a non-Spark parking, you could just navigate to it.',
  'Choose from the list of available Spark parking and reserve it by paying ahead of time. If it is a non-Spark parking, you could just navigate to it.'
];
final List<dynamic> _imageList = [
  'assets/images/walkthrough_1.png',
  'assets/images/walkthrough_2.png',
  'assets/images/walkthrough_3.png'
];

class WalkthroughOnboarding extends StatefulWidget {
  static final routeName = "/walkthrough-screen";
  @override
  State<StatefulWidget> createState() => _WalkthroughOnboarding();
}

class _WalkthroughOnboarding extends State<WalkthroughOnboarding> {

  @override
  void initState() {
    super.initState();

  }

  int _currentIndex = 0;
  PageController pageController = PageController();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: HexColor('#FFFFFF'),
        body: Stack(
          children: <Widget>[
            PageView.builder(
              itemBuilder: (context, index) => getPage(
                  _imageList[index],
                  _titlesList[index],
                  _subtitlesList[index],
                  context,
                  index + 1 == _titlesList.length),
              controller: pageController,
              itemCount: _titlesList.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: _titlesList.length,
                  effect: ScrollingDotsEffect(
                      activeDotColor: HexColor('#19BA19'),
                      dotColor: HexColor('#DFF2B5'),
                      dotWidth: 8,
                      dotHeight: 8),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getPage(dynamic image, String title, String subTitle,
      BuildContext context, bool isLastPage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        image is String
            ? Image.asset(
          image,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        )
            : Icon(
          image as IconData,
          color: Colors.white,
          size: 150,
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: TextStyle(color: HexColor('#525252'), fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                subTitle,
                style: TextStyle(color: HexColor('#6F6F6F'), fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _currentIndex + 1 == _titlesList.length
              ?
              SparkButton(
                color: HexColor('#19BA19'),
                textcolor: HexColor('#FFFFFF'),
                buttonText: "LET’S START".toUpperCase(),
                action: () => _LoginOptionScreen(context),
              )
          :
          Visibility(
            visible: false,
            child: Text(
              subTitle,
              style: TextStyle(color: HexColor('#6F6F6F'), fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

void _LoginOptionScreen(BuildContext context) =>
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) =>
        new LoginOptionScreen())
    );