import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/check_controller.dart';

class CheckView extends GetView<CheckController> {
  final CheckController controller = Get.put(CheckController());

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
