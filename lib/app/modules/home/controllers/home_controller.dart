/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-27 16:23:19
 */
import 'package:flutter_getx_project_template/app/utils/log/log.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print('some');
    Log.info('some');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
