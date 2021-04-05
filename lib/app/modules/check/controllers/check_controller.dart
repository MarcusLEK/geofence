import 'dart:developer';

import 'package:geofence/app/data/models/wifi.dart';
import 'package:get/get.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class CheckController extends GetxController {
  //TODO: Implement CheckController

  final wifi = Wifi().obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  updateWifi() async {
    var wifiName = await WifiInfo().getWifiName();

    // log(wifiName);

    wifi.update((value) {
      value.wifiName = wifiName;
    });
  }
}
