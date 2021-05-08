/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 11:10:14
 */
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/config/application.dart';
import 'package:flutter_getx_project_template/app/config/constants.dart';
import 'package:flutter_getx_project_template/app/lang/translation_service.dart';
import 'package:flutter_getx_project_template/app/plugins/options/options.dart';
import 'package:flutter_getx_project_template/app/plugins/options/scales.dart';
import 'package:flutter_getx_project_template/app/plugins/options/themes.dart';
import 'package:flutter_getx_project_template/app/routes/app_routes.dart';
import 'package:flutter_getx_project_template/app/utils/log/log.dart';
import 'package:get/get.dart';

import 'app/utils/network/http_utils.dart';

void main() {
  runApp(
    MyApp(),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  AppOptions? options;
  MyApp({
    Key? key,
    this.options,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _init(context);
    return GetMaterialApp(
      title: "GetXProject",
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppRoutes.main,
      getPages: AppRoutes.allPages,
      unknownRoute: AppRoutes.getNotFoundPage(),
      // logWriterCallback: LoggerConfig.write,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      builder: (context, child) => Directionality(
          textDirection: AppOptions().textDirection,
          child: _applyTextScaleFactor(child ?? Container())),
      routingCallback: (value) {
        Log.info(value?.current);
      },
    );
  }

  void _init(BuildContext context) {
    Application.context = context;
    Application.initPackageInfo();
    _initDio();
    // _initTheme();
    this.options = AppOptions(
        theme: lightTheme,
        textScaleFactor: AppTextScaleValue(null, 'System Default'),
        timeDilation: 1.0,
        platform: TargetPlatform.iOS,
        environment: environment,
        proxy: 'DIRECT');
    //设置设计稿的宽高
    setDesignWHD(375, 812);
  }

  void _initDio() {
    HttpUtils().initNetWork();
    //开启log
    Log.configuration(loggerLevel);
  }

  /// App字体大小不随系统字体改变
  Widget _applyTextScaleFactor(Widget child) {
    return Builder(
      builder: (BuildContext context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: child,
        );
      },
    );
  }
}
