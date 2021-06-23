/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:55:46
 * @LastEditors: ilmari
 * @LastEditTime: 2021-06-11 09:06:06
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/modules/home/service/service.dart';
import 'package:flutter_getx_project_template/app/resource/dimens.dart';
import 'package:flutter_getx_project_template/app/resource/resource_colors.dart';
import 'package:flutter_getx_project_template/app/routes/mine_route.dart';
import 'package:flutter_getx_project_template/app/routes/utils/get_navigator.dart';
import 'package:get/get.dart';

import '../controllers/mine_controller.dart';

class Person {
  String name = '';
  Person(
    this.name,
  );
}

class MinePage extends GetView<MineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            expandedHeight: Dimens.size200,
            stretch: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: Text("MinePage"),
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return buildRow(index, controller.titleList[index]);
            }, childCount: controller.titleList.length),
          ),
        ],
      ),
    );
  }

  Container buildRow(int index, String title) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(Dimens.size15, Dimens.size15, Dimens.size15, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.size8),
          color: ResourceColors.disabledBgColor),
      child: ListTile(
        title: Text("$title"),
        onTap: () {
          switch (index) {
            case 0:
              NavigatorUtils.push(MineRoute.SettingPageRoute);
              break;
            case 1:
              controller.logOut();
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
