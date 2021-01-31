import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_event.dart';
import 'package:spark_app/application/login/loginviaguest/landing_bloc.dart';
import 'package:spark_app/application/login/registration/registration_bloc.dart';
import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/repository/dashboardrepository/accountrepository/account_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/activityrepository/activity_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/homerepository/home_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/messagerepository/message_repository.dart';
import 'package:spark_app/core/repository/dashboardrepository/paymentrepository/payment_repository.dart';
import 'package:spark_app/core/repository/loginrepository/login_repository.dart';
import 'package:spark_app/core/routes/routes.dart';
import 'package:spark_app/core/utils/base_widgets.dart';
import 'package:spark_app/core/utils/utils.dart';

import 'models/spark_data_model.dart';

Alice globalAlice = Alice(
    showInspectorOnShake: false, showNotification: false, darkTheme: true);

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
  ValidationUtils _validationUtils;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  SparkDataModel _sparkDataModel;

  @override
  void initState() {
    super.initState();
    _apiService = ApiService(context: context);
    _apiService.setDio(Dio());
    _sparkDataModel = SparkDataModel();
    globalAlice.showInspector();
    this._loginRepository = LoginRepository(_apiService);
    this._validationUtils = ValidationUtils.instance();
    setFirebaseMessaging();
  }

  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}

  void setFirebaseMessaging() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessageReceived: $message");
        setState(() {
          
        });
      },
      onBackgroundMessage: _ApplicationState.myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ValidationUtils>.value(value: _validationUtils),
        Provider<BaseWidgets>.value(value: BaseWidgets.instance(context)),
        Provider<SparkDataModel>.value(value: _sparkDataModel),
        Provider<ApiService>.value(value: _apiService),
        Provider<FirebaseMessaging>.value(value: _firebaseMessaging),
        BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
                repository: this._loginRepository, buildContext: context)),
        BlocProvider<RegistrationBloc>(create: (_) => RegistrationBloc()),
        BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc(
            homePageRepository: HomeRepository(_apiService),
            activityPageRepository: ActivityRepository(),
            paymentPageRepository: PaymentRepository(),
            messagePageRepository: MessageRepository(),
            accountPageRepository: AccountRepository(),
          )..add(AppStarted()),
        ),
      ],
      child: MaterialApp(
        navigatorKey: ApiService.isLoggingUiEnabled
            ? globalAlice.getNavigatorKey()
            : null,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();

  }
}
