/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-13 14:11:53
 */
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_getx_project_template/app/config/constants.dart';
import 'package:flutter_getx_project_template/app/utils/toast/toast.dart';
import 'package:flutter_getx_project_template/app/widget/state/empty_widget.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../utils/extensions/extension_text.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
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
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => GetToast.show("msg"),
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
                Text('$environment')
              ],
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
