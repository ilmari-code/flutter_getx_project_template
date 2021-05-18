/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-05-10 08:49:59
 * @LastEditors: ilmari
 * @LastEditTime: 2021-05-18 10:01:12
 */
import 'package:flustars/flustars.dart';

extension DimensDoubleExt on double {
  double dimension({bool isFit = true}) {
    return (isFit ? ScreenUtil.getInstance().getAdapterSize(this) : this);
  }

  double getSizeByHeight({bool isFit = true}) {
    return (isFit ? ScreenUtil.getInstance().getHeight(this) : this);
  }
}

extension DimensIntExt on int {
  double dimension({bool isFit = true}) {
    return (isFit
        ? ScreenUtil.getInstance().getAdapterSize(this.toDouble())
        : this.toDouble());
  }

  double getSizeByHeight({bool isFit = true}) {
    return (isFit
        ? ScreenUtil.getInstance().getHeight(this.toDouble())
        : this.toDouble());
  }
}
