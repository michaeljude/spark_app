import 'package:flutter/material.dart';

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
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.insert_drive_file),
                  title: Text('Activity'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.payment),
                  title: Text('Payment'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.messenger),
                  title: Text('Message'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
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