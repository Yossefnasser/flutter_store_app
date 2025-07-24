import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
class ConnectivityController {
  ConnectivityController._();

  static final ConnectivityController instance = ConnectivityController._();
  
  ValueNotifier<bool> connection = ValueNotifier<bool>(true);
  
  Future<void> init() async {
    // Initialize connectivity controller if needed
    final result = 
    await Connectivity().checkConnectivity();
    
    checkConnectivity(result);
    Connectivity().onConnectivityChanged.
    listen(checkConnectivity);
    
  }
  void checkConnectivity(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile) ||
    result.contains(ConnectivityResult.wifi)) {
      connection.value = true;
    } else {
      connection.value = false;
    }
  }
}
