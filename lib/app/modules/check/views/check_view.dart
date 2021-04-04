import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/check_controller.dart';

class CheckView extends GetView<CheckController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CheckView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
