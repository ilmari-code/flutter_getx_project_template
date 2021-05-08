/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:23:52
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 09:29:53
 */
import 'package:flutter_getx_project_template/app/modules/mine/bindings/change_theme_binding.dart';
import 'package:flutter_getx_project_template/app/modules/mine/views/change_theme_page.dart';
import 'package:get/route_manager.dart';

class MineRoute {
  static const ChangeThemeRoute = '/changeThemeRoute';
  static List<GetPage> pages = [
    GetPage(
        name: ChangeThemeRoute,
        page: () => ChangeThemePage(),
        binding: ChangeThemeBinding())
  ];
}
