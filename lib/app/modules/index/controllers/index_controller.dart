/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 14:58:51
 * @LastEditors: ilmari
 * @LastEditTime: 2021-06-02 17:29:12
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getx_project_template/app/modules/features/controllers/features_controller.dart';
import 'package:flutter_getx_project_template/app/modules/features/views/features_view.dart';
import 'package:flutter_getx_project_template/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_getx_project_template/app/modules/home/views/home_page.dart';
import 'package:flutter_getx_project_template/app/modules/mine/controllers/mine_controller.dart';
import 'package:flutter_getx_project_template/app/modules/mine/views/mine_page.dart';
import 'package:flutter_getx_project_template/app/utils/keep_alive_page.dart';
import 'package:get/get.dart';

class IndexController extends GetxController {
  DateTime? lastTime;
  RxInt tabIndex = 0.obs;
  PageController? pageController;
  final List<Widget> pages = [
    keepAliveWrapper(GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return HomePage();
        })),
    keepAliveWrapper(GetBuilder<FeaturesController>(
        init: FeaturesController(),
        builder: (controller) {
          return FeaturesPage();
        })),
    keepAliveWrapper(GetBuilder<MineController>(
        init: MineController(),
        builder: (controller) {
          return MinePage();
        })),
  ];
  @override
  void onReady() {
    print("onReady");
    super.onReady();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: tabIndex.value);
    super.onInit();
  }
}
