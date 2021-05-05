/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-27 16:34:54
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-05 14:15:29
 */
import 'package:flustars/flustars.dart';
import 'package:flutter_getx_project_template/app/plugins/options/options.dart';
import 'package:logging/logging.dart';

Environment environment = Environment.dev;
// logger 打印配置
Level loggerLevel = environment == Environment.prod ? Level.OFF : Level.ALL;

//-----------------list 页数配置------------------
int pageSize = 10; //每页数量
int pageNum = 1; //列表第一页

double constantBannerHeight = ScreenUtil.getInstance().screenWidth * 9 / 16;
