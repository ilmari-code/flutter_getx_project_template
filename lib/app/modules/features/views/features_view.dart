/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-20 09:21:53
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 17:35:08
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/features_controller.dart';

class FeaturesPage extends GetView<FeaturesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FeaturesView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
              onPressed: () {
                controller.startAnimation();
              },
              child: Text("开始动画")),
          SizedBox(
            height: 200,
            child: Container(
              height: controller.animationLogo.value,
              width: controller.animationLogo.value,
              child: FlutterLogo(),
            ),
          ),
          AnimatedBuilder(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User',
              ),
            ),
            animation: controller.animationTextFieldUser,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(controller.animationTextFieldUser.value, 0),
                child: child,
              );
            },
          )
        ],
      )),
    );
  }
}
