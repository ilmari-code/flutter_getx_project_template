/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-29 13:54:19
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-29 13:54:20
 */
class Constant {
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false

  static bool isDriverTest = false;
  static bool isUnitTest = false;

  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';

  static const String keyGuide = 'keyGuide';
  static const String phone = 'phone';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  static const String theme = 'AppTheme';
  static const String locale = 'locale';
}
