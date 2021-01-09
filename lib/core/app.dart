import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_event.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_screen.dart';
import 'package:spark_app/application/login/loginviaguest/landing_bloc.dart';
import 'package:spark_app/application/login/loginviaguest/landing_state.dart';
import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/repository/dashboardrepository/accountrepository/account_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/activityrepository/activity_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/homerepository/home_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/messagerepository/message_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/paymentrepository/payment_repository.dart';
import 'package:spark_app/core/repository/loginrepository/login_repository.dart';
import 'package:spark_app/core/routes/routes.dart';


Alice globalAlice = Alice(
  showInspectorOnShake: false,
  showNotification: false,
);

Logger logger = Logger(
  printer: PrettyPrinter(),
);

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _Application(title: 'Flutter Demo Home Page'),
    );
  }

}

class _Application extends StatefulWidget {
  _Application({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ApplicationState createState() => _ApplicationState();

}

class _ApplicationState extends State<_Application> {

  ApiService _apiService;
  LoginRepository _loginRepository;

  @override
  void initState() {
    super.initState();
    _apiService = ApiService.instance;
    _apiService.setDio(Dio());
    this._loginRepository = LoginRepository();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        Provider<ApiService>.value(value: _apiService),
        BlocProvider<LoginBloc>(create: (_) => LoginBloc(repository: this._loginRepository)),
    BlocProvider<BottomNavigationBloc>(
    create: (context) => BottomNavigationBloc(
    homePageRepository: HomeRepository(),
    activityPageRepository: ActivityRepository(),
    paymentPageRepository: PaymentRepository(),
    messagePageRepository: MessageRepository(),
    accountPageRepository: AccountRepository(),
    )..add(AppStarted()),
    child: BottomNavigationScreen(),
    )
    ],
      child: MaterialApp(
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }

}







