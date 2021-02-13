import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_event.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_state.dart';
import 'package:spark_app/application/dashboard/model/user_status_model.dart';
import 'package:spark_app/core/models/home/get_status_response_model.dart';
import 'package:spark_app/core/repository/dashboardrepository/accountrepository/account_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/activityrepository/activity_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/homerepository/home_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/messagerepository/message_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/paymentrepository/payment_repository.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';
import 'package:spark_app/core/utils/constant_enums.dart';
import 'package:spark_app/core/utils/spark_constants.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final HomeRepository homePageRepository;
  final ActivityRepository activityPageRepository;
  final PaymentRepository paymentPageRepository;
  final MessageRepository messagePageRepository;
  final AccountRepository accountPageRepository;
  int currentIndex = 0;

  BottomNavigationBloc(
      {this.homePageRepository,
      this.activityPageRepository,
      this.paymentPageRepository,
      this.messagePageRepository,
      this.accountPageRepository})
      : assert(homePageRepository != null),
        assert(activityPageRepository != null),
        assert(paymentPageRepository != null),
        assert(messagePageRepository != null),
        assert(accountPageRepository != null),
        super(null);

  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        yield await _getHomePageData();
      }
      if (this.currentIndex == 1) {
        String data = await _getActivityPageData();
        yield ActivityPageLoaded(text: data);
      }
      if (this.currentIndex == 2) {
        String data = await _getPaymentPageData();
        yield PaymentPageLoaded(text: data);
      }
      if (this.currentIndex == 3) {
        String data = await _getMessagePageData();
        yield MessagePageLoaded(text: data);
      }
      if (this.currentIndex == 4) {
        String data = await _getAccountPageData();
        yield AccountPageLoaded(text: data);
      }
    }
  }

  Future<BottomNavigationState> _getHomePageData() async {
    String customerId = await LocalPersistence.instance().getCurrentUser();
    BottomNavigationState state;
    bool hasError = false;
    try {
      var result = await homePageRepository.getUserStatus(customerId);
      _setStatus(result);
    } catch (e) {
      debugPrint(e.toString());
      hasError = true;
    }

    try {
      var result = await homePageRepository.getParkingList();
      LocalPersistence localPersistence = LocalPersistence.instance();
      String parkingList = jsonEncode(result);
      localPersistence.securedStorage.saveString(SparkConstants.PARKING_LIST, parkingList);
    } catch(e) {
      hasError = true;
    }

    return HomePageLoaded(hasError);
  }

  void _setStatus(GetStatusResponseModel status) {
      UserStatusModel userStatusModel = UserStatusModel.instance();
      if(status.clientParkingStatus.toLowerCase() == SparkConstants.FREE.toLowerCase()) {
          userStatusModel.status = BookingStatus.FREE;
          debugPrint("FREE USER");
      }
      else if(status.clientParkingStatus.toLowerCase() == SparkConstants.BOOKED.toLowerCase()) {
        userStatusModel.status = BookingStatus.BOOKED;
        userStatusModel.position = Position(longitude: status.longitude, latitude: status.latitude);
        userStatusModel.transactionId = status.transaction_id;
        userStatusModel.parkingName = status.parkingName;
        debugPrint("BOOKED USER");
      }
      else if(status.clientParkingStatus.toLowerCase() == SparkConstants.PARKED.toLowerCase()) {
        userStatusModel.status = BookingStatus.PARKED;
        userStatusModel.position = Position(longitude: status.longitude, latitude: status.latitude);
        userStatusModel.transactionId = status.transaction_id;
        userStatusModel.parkingName = status.parkingName;
        debugPrint("PARKED USER");
      }
  }

  Future<String> _getActivityPageData() async {
    String data = activityPageRepository.data;
    if (data == null) {
      await activityPageRepository.fetchData();
      data = activityPageRepository.data;
    }
    return data;
  }

  Future<String> _getPaymentPageData() async {
    String data = paymentPageRepository.data;
    if (data == null) {
      await paymentPageRepository.fetchData();
      data = paymentPageRepository.data;
    }
    return data;
  }

  Future<String> _getMessagePageData() async {
    String data = messagePageRepository.data;
    if (data == null) {
      await messagePageRepository.fetchData();
      data = messagePageRepository.data;
    }
    return data;
  }

  Future<String> _getAccountPageData() async {
    String data = accountPageRepository.data;
    if (data == null) {
      await accountPageRepository.fetchData();
      data = accountPageRepository.data;
    }
    return data;
  }
}
