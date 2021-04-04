import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = 30;
    double textSize = 20;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Field cannot be empty';
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
                onPressed: () {
                  if (_formKey.currentState.validate()) {
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
    );
  }
}
