/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-08 11:17:21
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 11:18:28
 */
import 'package:flutter_getx_project_template/app/modules/mine/controllers/change_language_controller.dart';
import 'package:get/get.dart';

class ChageLanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeLanguageController>(() => ChangeLanguageController());
  }
}
