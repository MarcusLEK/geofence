import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Geofence Simulator'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.settings),
              ),
              Tab(
                icon: Icon(Icons.location_on),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text('Settings goes here'),
            ),
            Center(
              child: Text('checking of geofence goes here'),
            ),
          ],
        ),
      ),
    );
  }
}
