import 'package:flutter/material.dart';
import 'package:geofence/app/modules/settings/controllers/settings_controller.dart';

import 'package:get/get.dart';

import '../controllers/check_controller.dart';

class CheckView extends GetView<CheckController> {
  final CheckController controller = Get.put(CheckController());
  final SettingsController setting = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              return Text(
                "Wifi Name: ${controller.wifi.value.wifiName}",
              );
            }),
            ElevatedButton(
              onPressed: () {
                controller.updateWifi();
              },
              child: Text('Check Geofence'),
            ),
          ],
        ),
      ),
    );
  }
}
