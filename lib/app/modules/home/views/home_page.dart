/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-05 15:02:30
 */
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_getx_project_template/app/modules/mine/views/mine_page.dart';
import 'package:flutter_getx_project_template/app/widget/state/empty_widget.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../utils/extensions/extension_text.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: EasyRefresh(
        controller: controller.refreshController,
        onRefresh: () async {
          controller.page = 1;
          controller.getHomeData();
        },
        onLoad: () async {
          controller.page++;
          controller.getHomeData();
        },
        child: SingleChildScrollView(
          child: Center(
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
        ),
      ),
    );
  }
}

class HStateWidget extends StatelessWidget {
  HStateWidget({Key? key}) : super(key: key);
  final text = Text("data").bold();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}
