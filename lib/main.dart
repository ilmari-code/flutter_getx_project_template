/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-19 16:10:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-05 09:27:47
 */
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/config/application.dart';
import 'package:flutter_getx_project_template/app/config/constants.dart';
import 'package:flutter_getx_project_template/app/lang/translation_service.dart';
import 'package:flutter_getx_project_template/app/plugins/options/options.dart';
import 'package:flutter_getx_project_template/app/plugins/options/scales.dart';
import 'package:flutter_getx_project_template/app/plugins/options/themes.dart';
import 'package:flutter_getx_project_template/app/resource/dimens.dart';
import 'package:flutter_getx_project_template/app/resource/resource_colors.dart';
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
    _initTheme();
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

  void _initTheme() {
    lightTheme = AppTheme('Light', _buildLightTheme());
    darkTheme = AppTheme('Dark', ThemeData.dark());
  }

  //设置默认的主题
  ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light();
    Color primaryColor = ResourceColors.color_08B16B;
    Color secondaryColor = ResourceColors.color_08B16B;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    return base.copyWith(
        colorScheme: colorScheme,
        primaryColor: primaryColor,
        primaryColorBrightness: Brightness.light,
        accentColor: secondaryColor,
        buttonColor: primaryColor,
        disabledColor: ResourceColors.disabledBgColor,
        hintColor: ResourceColors.minorTextColor,
        dividerColor: ResourceColors.lineColor,
        canvasColor: Colors.white,
        scaffoldBackgroundColor: ResourceColors.backgroundColor,
        backgroundColor: Colors.white,
        primaryTextTheme: _buildPrimaryTextTheme(base.primaryTextTheme),
        primaryIconTheme: _buildPrimaryIconTheme(base.primaryIconTheme),
        accentTextTheme: _buildAccentTextTheme(base.accentTextTheme),
        appBarTheme: AppBarTheme(
            elevation: 0, iconTheme: IconThemeData(size: Dimens.size18)),
        textTheme: _buildTextTheme(base.textTheme),
        typography: _buildTypographyTheme(base.typography),
        buttonTheme: base.buttonTheme.copyWith(
          colorScheme: colorScheme,
          textTheme: ButtonTextTheme.primary,
          buttonColor: primaryColor,
        ));
  }

  // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
  TextTheme _buildPrimaryTextTheme(TextTheme base) {
    return base.apply(fontFamily: 'PingFang SC');
  }

  TextTheme _buildAccentTextTheme(TextTheme base) {
    return base.apply(fontFamily: 'PingFang SC');
  }

  IconThemeData _buildPrimaryIconTheme(IconThemeData base) {
    return base.copyWith();
  }

  TextTheme _buildTextTheme(TextTheme base) {
    return base
        .copyWith(
          button: TextStyle(fontWeight: FontWeight.normal),
          // 修复 textfield hint text 不对齐
          subtitle2:
              base.subtitle2?.copyWith(textBaseline: TextBaseline.alphabetic),
        )
        .apply(fontFamily: 'PingFang SC');
  }

  _buildTypographyTheme(Typography typography) {
    return typography.copyWith();
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
