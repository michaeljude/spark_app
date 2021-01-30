import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {

  FirebaseMessaging _firebaseMessaging;

  FirebaseMessaging get firebaseMessaging => _firebaseMessaging;

  FirebaseService(this._firebaseMessaging);

  void dispose() {
    _firebaseMessaging = null;
  }


  Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
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
        print("onMessage: $message");
      },
      //onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

}