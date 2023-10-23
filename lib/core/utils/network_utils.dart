import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';

class NetworkUtils {
  static bool _isConnectToInternet = true;

  static Future<void> connect() async {
    final connectResult = await (Connectivity().checkConnectivity());
    switch (connectResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.vpn:
        try {
          final result = await InternetAddress.lookup('google.com');
          _isConnectToInternet =
          result.isNotEmpty && result[0].rawAddress.isNotEmpty
              ? true
              : false;
        } on SocketException catch (_) {
          _isConnectToInternet = false;
        } on ClientException catch (_) {
          _isConnectToInternet = false;
        }
        break;
      case ConnectivityResult.none:
        _isConnectToInternet == false;
        break;
      case ConnectivityResult.bluetooth:
        break;
      case ConnectivityResult.other:
        // TODO: Handle this case.
    }
  }
  static bool hasConnection() {
    print(_isConnectToInternet);
    return _isConnectToInternet;
  }

  static Stream<ConnectivityResult> connectionListener() {
    return Connectivity().onConnectivityChanged;
  }
}

