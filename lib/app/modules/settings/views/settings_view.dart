import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  final _formKey = GlobalKey<FormState>();
  final SettingsController settingsController = Get.put(SettingsController());

  final positionController = TextEditingController();
  final radiusController = TextEditingController();
  final wifiNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = 30;
    double textSize = 20;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height),
                  Text(
                    'Position - Longtitude, Latitude',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: textSize,
                    ),
                  ),
                  TextFormField(
                    controller: positionController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Field cannot be empty';
                      }
                    },
                  ),
                  SizedBox(height: height),
                  Text(
                    'Radius - in KM',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: textSize,
                    ),
                  ),
                  TextFormField(
                    controller: radiusController,
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Field cannot be empty';
                      } else {
                        final rad = num.tryParse(val);
                        if (rad == null) {
                          return 'Must be numeric';
                        }
                      }
                    },
                  ),
                  SizedBox(height: height),
                  Text(
                    'WIFI name',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: textSize,
                    ),
                  ),
                  TextFormField(
                    controller: wifiNameController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Field cannot be empty';
                      }
                    },
                  ),
                  SizedBox(height: height),
                  ElevatedButton(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: textSize,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        var res = await controller.updateSetting(
                          positionController.text,
                          radiusController.text,
                          wifiNameController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Settings Saved!')),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
