/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-18 09:40:49
 */
import 'package:flutter_getx_project_template/app/modules/index/bindings/index_binding.dart';
import 'package:flutter_getx_project_template/app/modules/index/views/index_page.dart';
import 'package:flutter_getx_project_template/app/routes/404.dart';
import 'package:flutter_getx_project_template/app/routes/feature_routes.dart';
import 'package:flutter_getx_project_template/app/routes/home_route.dart';
import 'package:flutter_getx_project_template/app/routes/login_route.dart';
import 'package:flutter_getx_project_template/app/routes/mine_route.dart';
import 'package:get/get.dart';

class AppRoutes {
  ///主页面
  static final String main = "/main";

  ///全局webview
  static final String webView = "/webView";

  ///发大查看图片page
  static final String photoViewPage = "/photoViewPage";

  static final List<GetPage> allPages = []
    ..add(
      GetPage(name: main, page: () => IndexPage(), binding: IndexBinding()),
    )
    ..addAll(HomeRoute.pages)
    ..addAll(FeaturesRoute.pages)
    ..addAll(MineRoute.pages)
    ..addAll(LoginRoute.pages);

  static GetPage getNotFoundPage() {
    return GetPage(name: '/notfound', page: () => NotFoundPage());
  }
}
