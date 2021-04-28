/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-08 18:09:36
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-27 16:17:52
 */
import 'package:flutter_getx_project_template/app/routes/app_routes.dart';
import 'package:get/get.dart';

class NavigatorUtils {
  //导航到下一个页面
  static push(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(page,
        arguments: arguments,
        id: id,
        preventDuplicates: preventDuplicates,
        parameters: parameters);
  }

  //浏览并删除前一个页面
  static offNamed(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    Get.offNamed(page,
        arguments: arguments,
        id: id,
        preventDuplicates: preventDuplicates,
        parameters: parameters);
  }

  //浏览并删除所有以前的页面。
  static offAllNamed(String page) {
    Get.offAllNamed(page);
  }

  //关闭SnackBars、Dialogs、BottomSheets或任何你通常会用Navigator.pop(context)关闭的东西
  static goBack<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    Get.back(
        result: result, closeOverlays: closeOverlays, canPop: canPop, id: id);
  }

  static pushToWebView(String title, String url) {
    push(AppRoutes.webView, parameters: {"title": title, "url": url});
  }

  // static pushToPhotoViewPage(List<String> path, [int? index]) {
  //   if (path.isNotEmpty) {
  //     push(RouteConfig.photoViewPage, arguments: PhotoViewModel(path, index));
  //   }
  // }

  static void pushToRoot() {
    Get.offNamedUntil(AppRoutes.main, (route) {
      return route.isFirst;
    });
  }
}

class PhotoViewModel {
  List<String> path;
  int index;

  PhotoViewModel(this.path, this.index);
}
