import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class ConnectivityViewModel extends ChangeNotifier {
  bool? _isConnected;
  bool? get isConnected => _isConnected;
  Stream<List<ConnectivityResult>>? _connectivityStream;
  Stream<List<ConnectivityResult>>? get connectivityStream =>
      _connectivityStream;

  final Connectivity _connectivity = Connectivity();

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
      for (var element in result) {
        if (element.name == "none") {
          _isConnected = false;
          notifyListeners();
        } else {
          _isConnected = true;
          notifyListeners();
        }
      }
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status ${e.code}');
      return;
    }
  }

  void initConnectivityStream() {
    _connectivityStream = _connectivity.onConnectivityChanged;
    notifyListeners();
  }
}
