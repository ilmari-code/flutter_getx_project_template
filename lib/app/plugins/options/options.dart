/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-25 10:58:43
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-27 16:34:01
 */
import 'dart:io';

import 'package:flutter/material.dart';

import '../../plugins/options/scales.dart';
import '../../plugins/options/themes.dart';

enum Environment { prod, pre, test, dev }

class AppOptions {
  AppOptions({
    this.theme,
    this.textScaleFactor,
    this.textDirection = TextDirection.ltr,
    this.timeDilation = 1.0,
    this.platform,
    this.environment,
    this.proxy,
    this.showOffscreenLayersCheckerboard = false,
    this.showRasterCacheImagesCheckerboard = false,
    this.showPerformanceOverlay = false,
  });

  final AppTheme? theme;
  final AppTextScaleValue? textScaleFactor;
  final TextDirection textDirection;
  final double timeDilation;
  final TargetPlatform? platform;
  final Environment? environment;

  /// See [HttpClient.findProxy]
  final String? proxy;
  final bool showPerformanceOverlay;
  final bool showRasterCacheImagesCheckerboard;
  final bool showOffscreenLayersCheckerboard;

  AppOptions copyWith({
    AppTheme? theme,
    AppTextScaleValue? textScaleFactor,
    TextDirection? textDirection,
    double? timeDilation,
    TargetPlatform? platform,
    Environment? environment,
    String? proxy,
    bool? showPerformanceOverlay,
    bool? showRasterCacheImagesCheckerboard,
    bool? showOffscreenLayersCheckerboard,
  }) {
    return AppOptions(
      theme: theme ?? this.theme,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      textDirection: textDirection ?? this.textDirection,
      timeDilation: timeDilation ?? this.timeDilation,
      platform: platform ?? this.platform,
      environment: environment ?? this.environment,
      proxy: proxy ?? this.proxy,
      showPerformanceOverlay:
          showPerformanceOverlay ?? this.showPerformanceOverlay,
      showOffscreenLayersCheckerboard: showOffscreenLayersCheckerboard ??
          this.showOffscreenLayersCheckerboard,
      showRasterCacheImagesCheckerboard: showRasterCacheImagesCheckerboard ??
          this.showRasterCacheImagesCheckerboard,
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final AppOptions typedOther = other;
    return theme == typedOther.theme &&
        textScaleFactor == typedOther.textScaleFactor &&
        textDirection == typedOther.textDirection &&
        platform == typedOther.platform &&
        showPerformanceOverlay == typedOther.showPerformanceOverlay &&
        showRasterCacheImagesCheckerboard ==
            typedOther.showRasterCacheImagesCheckerboard &&
        showOffscreenLayersCheckerboard ==
            typedOther.showRasterCacheImagesCheckerboard;
  }

  @override
  int get hashCode => hashValues(
        theme,
        textScaleFactor,
        textDirection,
        timeDilation,
        platform,
        showPerformanceOverlay,
        showRasterCacheImagesCheckerboard,
        showOffscreenLayersCheckerboard,
      );

  @override
  String toString() {
    return '$runtimeType($theme)';
  }
}
