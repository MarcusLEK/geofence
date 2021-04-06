import 'package:connectivity/connectivity.dart';
import 'package:geofence/app/data/models/wifi.dart';
import 'package:geofence/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class CheckController extends GetxController {
  final wifi = Wifi().obs;

  final status = 'Outside'.obs;

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
      return true;
    } else {
      return false;
    }
  }
}
