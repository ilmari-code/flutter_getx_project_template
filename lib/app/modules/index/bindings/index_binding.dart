/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:22:13
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-27 15:22:35
 */
import 'package:flutter_getx_project_template/app/modules/index/controllers/index_controller.dart';
import 'package:get/get.dart';

class IndexBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(() => IndexController());
  }
}
