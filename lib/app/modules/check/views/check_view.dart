import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/check_controller.dart';

class CheckView extends GetView<CheckController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Checks and display if in geofence area',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
