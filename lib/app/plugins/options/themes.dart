import 'package:flutter/material.dart';

class AppTheme {
  final String name;
  final ThemeData data;

  AppTheme(this.name, this.data);
}

AppTheme darkTheme = AppTheme('Dark', ThemeData.dark());
AppTheme lightTheme = AppTheme('Light', ThemeData.light());
