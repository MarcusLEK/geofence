import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:geofence/app/data/models/status.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

import '../../../data/models/wifi.dart';
import '../../settings/controllers/settings_controller.dart';

class CheckController extends GetxController {
  final wifi = Wifi().obs;
  final SettingsController settingsController = Get.put(SettingsController());

  final status = Status().obs;

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

  updateGeoStatus(String stat) {
    status.update((val) {
      val.geoStatus = stat;
    });
  }

  checkGeofence() {
    String storedWifi =
        (settingsController.setting.value.wifiName).toLowerCase();
    String wifiName = (wifi.value.wifiName).toLowerCase();
    if (storedWifi == wifiName) {
      updateGeoStatus('Inside');
    } else {
      updateGeoStatus('Outside');
    }
  }

  checkPermission() async {
    var locationStatus = await Permission.location.status;
    var connectivityStatus = await (Connectivity().checkConnectivity());

    print(locationStatus);

    if (!locationStatus.isGranted) {
      await Permission.location.request();
    }

    if (locationStatus.isPermanentlyDenied) {
      openAppSettings();
    }

    if (await Permission.locationWhenInUse.serviceStatus.isEnabled &&
        connectivityStatus == ConnectivityResult.wifi) {
      updateWifi();
      checkGeofence();
      print(status.value.geoStatus);
      return true;
    } else {
      return false;
    }
  }
}
