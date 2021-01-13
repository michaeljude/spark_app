import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_event.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_state.dart';
import 'package:spark_app/core/repository/dashboardrepository/accountrepository/account_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/activityrepository/activity_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/homerepository/home_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/messagerepository/message_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/paymentrepository/payment_repository.dart';


class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final HomeRepository homePageRepository;
  final ActivityRepository activityPageRepository;
  final PaymentRepository paymentPageRepository;
  final MessageRepository messagePageRepository;
  final AccountRepository accountPageRepository;
  int currentIndex = 0;

  BottomNavigationBloc({
    this.homePageRepository,
    this.activityPageRepository,
    this.paymentPageRepository,
    this.messagePageRepository,
    this.accountPageRepository
  }) :  assert(homePageRepository != null),
        assert(activityPageRepository != null),
        assert(paymentPageRepository != null),
        assert(messagePageRepository != null),
        assert(accountPageRepository != null), super(null);

  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        String data = await _getHomePageData();
        yield HomePageLoaded(text: data);
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
        yield MessagePageLoaded(text: data);
      }
    }
  }

  Future<String> _getHomePageData() async {
    String data = homePageRepository.data;
    if (data == null) {
      await homePageRepository.fetchData();
      data = homePageRepository.data;
    }
    return data;
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