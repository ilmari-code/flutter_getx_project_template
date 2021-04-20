/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-19 18:09:12
 */
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  //TODO: Implement HomeController

  final count = 0.obs;

  HomeController() {}

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
