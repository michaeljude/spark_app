import 'package:flutter/material.dart';

class SparkApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(title: 'Flutter Demo Home Page'),
    );
  }

}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();


}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff92CC12),
                    const Color(0xff19BA19)
                  ],
                  tileMode: TileMode.repeated
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 200, 20, 20),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Icon(
                      Icons.access_alarm,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }

}
