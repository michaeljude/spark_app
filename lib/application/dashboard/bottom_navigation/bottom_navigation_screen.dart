import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/dashboard/account/account_screen.dart';
import 'package:spark_app/application/dashboard/activity/activity_screen.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:spark_app/application/dashboard/home/home_screen.dart';
import 'package:spark_app/application/dashboard/message/messagelist/message_screen.dart';
import 'package:spark_app/application/dashboard/payment/payment_screen.dart';
import 'package:spark_app/core/utils/dialog.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationScreen extends StatefulWidget {
  static final String routeName = "/bottom_navigation";

  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => BottomNavigationScreen());

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  BottomNavigationBloc bottomNavigationBloc;

  ScrollController _hideBottomNavController;

  bool _isVisible;


  @override
  void initState() {
    super.initState();

    _isVisible = true;
    _hideBottomNavController = ScrollController();
    _hideBottomNavController.addListener(
          () {
        if (_hideBottomNavController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (_isVisible)
            setState(() {
              _isVisible = false;
            });
        }
        if (_hideBottomNavController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!_isVisible)
            setState(() {
              _isVisible = true;
            });
        }
      },
    );

    bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);
    bottomNavigationBloc.add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //sample

      body: BlocConsumer<BottomNavigationBloc, BottomNavigationState>(

        listener: (context, state) {

          if (state is HomePageLoaded) {

            if (state.hasError) {
              DialogUtils.showErrorsDialog(context, 'Something went wrong');
            }
          }
        },
        builder: (context, state) {

          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HomePageLoaded) {

            return HomeScreen();
          }
          if (state is ActivityPageLoaded) {
            return ActivityScreen(text: state.text);
          }
          if (state is PaymentPageLoaded) {
            return PaymentScreen(text: state.text);
          }
          if (state is MessagePageLoaded) {
            return MessageScreen(text: state.text);
          }
          if (state is AccountPageLoaded) {
            return AccountScreen(text: state.text);
          }
          return Container();
        },
      ),

      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (BuildContext context, BottomNavigationState state) {
        return
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
                height: _isVisible ? 56.0 : 0.0,
                child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          currentIndex: bottomNavigationBloc.currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home),
              title: Text('Home',
              style: TextStyle(fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300),),
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.file),
              title: Text('Activity',
                style: TextStyle(fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300),),
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.creditCard),
              title: Text('Payment',
                style: TextStyle(fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300),),
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.messageSquare),
              title: Text('Messages',
                style: TextStyle(fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300),),
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user),
              title: Text('Account',
                style: TextStyle(fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300),),
            ),
          ],
          onTap: (index) => bottomNavigationBloc.add(PageTapped(index: index)),
                ),
          );
      }),
    );
  }

  static FirebaseMessaging() {}
}
