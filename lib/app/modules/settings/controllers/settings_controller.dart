import 'package:get/get.dart';

import '../../../data/models/setting.dart';

class SettingsController extends GetxController {
  final setting = Setting().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  updateSetting(String pos, String rad, String wifi) {
    setting.update((val) {
      val.position = pos;
      val.radius = int.parse(rad);
      val.wifiName = wifi;

      // log(val.position);
      // log(val.radius.toString());
      // log(val.position);
    });
    return false;
  }
}
