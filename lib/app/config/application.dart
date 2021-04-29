/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-29 10:23:58
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-29 10:25:09
 */

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class Application {
  static BuildContext? context;
  static PackageInfo? packageInfo;
  static void initPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }
}
