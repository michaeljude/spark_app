import 'package:flutter/material.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:spark_app/application/dashboard/home/home_screen.dart';
import 'package:spark_app/application/dashboard/activity/activity_screen.dart';
import 'package:spark_app/application/dashboard/payment/payment_screen.dart';
import 'package:spark_app/application/dashboard/message/message_screen.dart';
import 'package:spark_app/application/dashboard/account/account_screen.dart';

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationScreen extends StatefulWidget {

  static final String routeName = "/bottom_navigation";

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);

    return Scaffold(

      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HomePageLoaded) {
            return HomeScreen(text: state.text);
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
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.green,
                currentIndex: bottomNavigationBloc.currentIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.file),
                  title: Text('Activity'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.creditCard),
                  title: Text('Payment'),
                ),
                BottomNavigationBarItem(
                  icon: new Stack(
                    children: <Widget>[
                      new Icon(FeatherIcons.messageCircle),
                      new Positioned(
                        right: 0,
                        child: new Container(
                          padding: EdgeInsets.only(left: 1.0, top: 2.0, bottom: 1.0, right: 1.0),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                          child: new Text(
                            '2',
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                  title: new Text('Message'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.user),
                  title: Text('Account'),
                ),
              ],
              onTap: (index) => bottomNavigationBloc.add(PageTapped(index: index)),
            );
          }
      ),
    );
  }
}