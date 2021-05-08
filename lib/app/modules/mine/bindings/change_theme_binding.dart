/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-08 09:29:25
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 09:29:40
 */
import 'package:flutter_getx_project_template/app/modules/mine/controllers/change_theme_controller.dart';
import 'package:get/get.dart';

class ChangeThemeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeThemeController>(() => ChangeThemeController());
  }
}
