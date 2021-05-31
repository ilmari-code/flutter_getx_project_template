/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-12 15:49:52
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-27 11:47:56
 */
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_project_template/app/routes/login_route.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/config/application.dart';
import 'app/config/constants.dart';
import 'app/lang/translation_service.dart';
import 'app/plugins/options/options.dart';
import 'app/plugins/options/scales.dart';
import 'app/plugins/options/themes.dart';
import 'app/routes/app_routes.dart';
import 'app/utils/log/log.dart';
import 'app/utils/network/http_utils.dart';
import 'app/utils/sp_utils/sp_utils.dart';

///runApp之前调用的方法
Future<void> initApp(Environment environ) async {
  WidgetsFlutterBinding.ensureInitialized();
  // 强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //sp init
  await SpUtils.init();
  environment = environ;
}

class MyApp extends StatelessWidget {
  AppOptions? options;
  final Environment? environment;
  MyApp({
    Key? key,
    this.options,
    this.environment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _init(context);
    return GetMaterialApp(
      title: "GetXProject",
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: SpUtils.get<bool>('isLogin', initValue: false)
          ? AppRoutes.main
          : LoginRoute.login,
      getPages: AppRoutes.allPages,
      unknownRoute: AppRoutes.getNotFoundPage(),
      // logWriterCallback: LoggerConfig.write,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      builder: (context, child) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Directionality(
            textDirection: AppOptions().textDirection,
            child: _applyTextScaleFactor(child ?? Container())),
      ),
      routingCallback: (value) {
        Log.info(value?.current);
      },
    );
  }

  void _init(BuildContext context) {
    String themeName = SpUtils.get<String>('theme');
    Application.context = context;
    Application.initPackageInfo();
    _initDio();
    var currentTheme = appThemes.firstWhere(
        (element) => (element.name == themeName),
        orElse: () => lightTheme);
    Get.changeTheme(currentTheme.data);
    // _initTheme();
    this.options = AppOptions(
        textScaleFactor: AppTextScaleValue(null, 'System Default'),
        timeDilation: 1.0,
        platform: TargetPlatform.iOS,
        environment: this.environment,
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
