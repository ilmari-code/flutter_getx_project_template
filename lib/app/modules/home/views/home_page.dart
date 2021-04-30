/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-30 09:08:03
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/modules/mine/views/mine_page.dart';
import 'package:flutter_getx_project_template/app/widget/state/empty_widget.dart';
import 'package:flutter_getx_project_template/app/widget/state/state_widget.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Get.to(MinePage()),
          child: controller.obx(
            (state) => Text(
              '''
            ${state?.account}
            ${state?.phone}
            ${state?.username}
            ${state?.avatar}
              ''',
              style: TextStyle(fontSize: 20),
            ),
            onError: (error) => EmptyWidget(),
          ),
        ),
      ),
    );
  }
}
