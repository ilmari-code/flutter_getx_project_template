/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-29 10:18:26
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-08 10:41:57
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/app/resource/dimens.dart';
import 'package:flutter_getx_project_template/app/resource/resource_colors.dart';

class AppTheme {
  final String name;
  final ThemeData data;

  AppTheme(this.name, this.data);
}

AppTheme lightTheme = AppTheme('Light', ThemeData.light());
AppTheme darkTheme = AppTheme('Dark', ThemeData.dark());
AppTheme customTheme = AppTheme('Custom', _buildCustomTheme());
//设置默认的主题
ThemeData _buildCustomTheme() {
  final ThemeData base = ThemeData.light();
  Color primaryColor = ResourceColors.red_bg;
  Color secondaryColor = Colors.red;
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
      dividerColor: Colors.red,
      canvasColor: Colors.red,
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
        subtitle1: base.subtitle1?.copyWith(
            textBaseline: TextBaseline.alphabetic, fontSize: DimenFont.sp40),
        // 修复 textfield hint text 不对齐
        subtitle2:
            base.subtitle2?.copyWith(textBaseline: TextBaseline.alphabetic),
      )
      .apply(fontFamily: 'PingFang SC');
}

_buildTypographyTheme(Typography typography) {
  return typography.copyWith();
}
