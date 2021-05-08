/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 15:23:52
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 15:51:22
 */
import 'package:flutter_getx_project_template/app/modules/mine/bindings/change_language_binding.dart';
import 'package:flutter_getx_project_template/app/modules/mine/bindings/change_theme_binding.dart';
import 'package:flutter_getx_project_template/app/modules/mine/bindings/setting_binding.dart';
import 'package:flutter_getx_project_template/app/modules/mine/views/change_language_page.dart';
import 'package:flutter_getx_project_template/app/modules/mine/views/change_theme_page.dart';
import 'package:flutter_getx_project_template/app/modules/mine/views/setting_page.dart';
import 'package:get/route_manager.dart';

class MineRoute {
  static const SettingPageRoute = '/settingPageRoute';
  static const ChangeThemeRoute = '/changeThemeRoute';
  static const ChangeLanguageRoute = '/changeLanguageRoute';
  static List<GetPage> pages = [
    GetPage(
        name: SettingPageRoute,
        page: () => SettingPage(),
        binding: SettingBinding()),
    GetPage(
        name: ChangeThemeRoute,
        page: () => ChangeThemePage(),
        binding: ChangeThemeBinding()),
    GetPage(
        name: ChangeLanguageRoute,
        page: () => ChangeLanguagePage(),
        binding: ChageLanguageBinding())
  ];
}
