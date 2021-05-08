/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-29 14:56:35
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-29 15:06:42
 */
import 'package:get_storage/get_storage.dart';

class SpUtils {
  static const String spStorageKey = 'getx_project_template';
  static GetStorage? box;

  static String nowStorage = spStorageKey;

  static Future<bool> init({String container = spStorageKey}) async {
    return await GetStorage.init(container);
  }

  static Future<void> put(String key, dynamic value,
      [String container = spStorageKey]) async {
    _getBox(container);
    await box?.write(key, value);
  }

  static T get<T>(String key, {T? initValue, String container = spStorageKey}) {
    _getBox(container);
    if (initValue == null) {
      return box?.read(key) ?? '' as T;
    } else {
      return box?.read(key) ?? initValue;
    }
  }

  static Future<void> remove(String key,
      {String container = spStorageKey}) async {
    _getBox(container);
    await box?.remove(key);
  }

  static Future<void> clear({String container = spStorageKey}) async {
    _getBox(container);
    await box?.erase();
  }

  static void _getBox(String container) {
    if (box == null || nowStorage != container) {
      nowStorage = container;
      box = GetStorage(container);
    }
  }
}
