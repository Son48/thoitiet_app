import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseAPI {
  //CREATE AN INSTACE OF FIREBASE
  final _firebaseMessaging = FirebaseMessaging.instance;
  //function to initialize notifications
  Future<void> initNotification() async {
    //request permision from user
    await _firebaseMessaging.requestPermission();
    //fetch FCM TOKEN
    final fCMToken = await _firebaseMessaging.getToken();
    //print fcm token
    print("fcm-token:$fCMToken");
  }
}
