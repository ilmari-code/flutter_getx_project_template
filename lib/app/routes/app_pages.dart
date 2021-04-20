import 'package:get/get.dart';

import 'package:flutter_getx_project_template/app/modules/features/bindings/features_binding.dart';
import 'package:flutter_getx_project_template/app/modules/features/views/features_view.dart';
import 'package:flutter_getx_project_template/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_getx_project_template/app/modules/home/views/home_view.dart';
import 'package:flutter_getx_project_template/app/modules/mine/bindings/mine_binding.dart';
import 'package:flutter_getx_project_template/app/modules/mine/views/mine_view.dart';

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
      name: _Paths.MINE,
      page: () => MineView(),
      binding: MineBinding(),
    ),
    GetPage(
      name: _Paths.FEATURES,
      page: () => FeaturesView(),
      binding: FeaturesBinding(),
    ),
  ];
}
