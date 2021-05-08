/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:55:46
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 14:38:54
 */
import 'package:get/get.dart';

class MineController extends GetxController {
  final count = 0.obs;
  List titleList = ['修改主题', '修改语言', 'Toast'];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
