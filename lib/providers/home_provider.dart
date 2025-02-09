import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  Map<String, bool> devices = {
    'Living Room Lights': false,
    'Bedroom Lights': false,
    'AC': false,
    'TV': false,
    'Security System': true,
  };

  double temperature = 22.0;
  double energyUsage = 45.0;

  void toggleDevice(String deviceName) {
    devices[deviceName] = !devices[deviceName]!;
    notifyListeners();
  }

  void setTemperature(double value) {
    temperature = value;
    notifyListeners();
  }
}