import 'package:flutter/material.dart';
import 'package:spark_app/theme/app_theme.dart';

class ActivityScreen extends StatefulWidget {
  static final String routeName = "/activity";

  final String text;

  ActivityScreen({this.text}) : super();

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {

  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(text: 'Ongoing'),
    Tab(text: 'Done'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
            indicatorColor: HexColor('#19BA19'),
            labelColor: HexColor('#19BA19'),
            unselectedLabelColor: HexColor('#525252'),
          ),

          title:
          Align(
          alignment: Alignment.center,
          child: Text('Activity', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: HexColor('#525252')
          ),
          ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: HexColor('#FFFFFF'),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Center(
                child: Text(
                  'Ongoing List',
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  'Done List',
                  style: TextStyle(fontSize: 40),
                )),
          ],
        ),
    );
  }
}