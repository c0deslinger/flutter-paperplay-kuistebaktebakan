import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

enum NetworkStatus { online, offline }

class NetworkStatusController extends GetxController {
  final currentNetworkStatus = NetworkStatus.offline.obs;

  //Instance of Flutter Connectivity
  final Connectivity _connectivity = Connectivity();
  //Stream to keep listening to network change state
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectinType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  // a method to get which connection result, if you we connected to internet or no if yes then which network
  Future<void> getConnectinType() async {
    ConnectivityResult? connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    return _updateState(connectivityResult);
  }

  // state update, of network, if you are connected to WIFI connectionType will get set to 1,
  // and update the state to the consumer of that variable.
  _updateState(ConnectivityResult? result) {
    switch (result) {
      case ConnectivityResult.wifi:
        currentNetworkStatus.value = NetworkStatus.online;
        update();
        break;
      case ConnectivityResult.mobile:
        currentNetworkStatus.value = NetworkStatus.online;
        update();
        break;
      default:
        currentNetworkStatus.value = NetworkStatus.offline;
        update();
        break;
    }
  }

  @override
  void onClose() {
    //stop listening to network state when app is closed
    _streamSubscription.cancel();
  }
}
