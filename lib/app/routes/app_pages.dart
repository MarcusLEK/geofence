import 'package:get/get.dart';

import 'package:geofence/app/modules/home/bindings/home_binding.dart';
import 'package:geofence/app/modules/home/views/home_view.dart';
import 'package:geofence/app/modules/settings/bindings/settings_binding.dart';
import 'package:geofence/app/modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
