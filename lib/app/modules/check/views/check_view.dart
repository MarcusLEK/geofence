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
                "Wifi Name: ${(controller.wifi.value.wifiName == null) ? 'Not Connected' : controller.wifi.value.wifiName}",
              );
            }),
            Obx(() {
              return Text(
                "Geofence Status: \n\n${controller.status.value.geoStatus}",
                textAlign: TextAlign.center,
              );
            }),
            ElevatedButton(
              onPressed: () async {
                var res = await controller.checkPermission();
                print(res);
                if (!res) {
                  Get.defaultDialog(
                    title: 'Connectivity Alert !',
                    titleStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    content: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'This app requires locations services and wifi to work properly.',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Please enable it and try again.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  );
                }
              },
              child: Text('Check Geofence'),
            ),
          ],
        ),
      ),
    );
  }
}
