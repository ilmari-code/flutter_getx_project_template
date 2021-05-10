/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:55:46
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 17:52:10
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturesController extends GetxController
    with SingleGetTickerProviderMixin, StateMixin {
  final count = 0.obs;
  late AnimationController animationController;
  late Animation<double> animationLogo;
  late Animation<double> animationTextFieldUser;
  @override
  void onInit() {
    animationController = AnimationController(vsync: this, duration: 2.seconds);
    animationLogo = Tween<double>(begin: 0, end: 150)
        .animate(animationController)
          ..addListener(() => update());
    animationTextFieldUser = Tween<double>(begin: Get.width, end: 0)
        .animate(animationController)
          ..addListener(() => update());
    // animationController.forward();
    super.onInit();
  }

  void startAnimation() {
    animationController.forward();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
