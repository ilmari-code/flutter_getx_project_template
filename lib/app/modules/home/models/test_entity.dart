import 'package:flutter_getx_project_template/generated/json/base/json_convert_content.dart';

class TestEntity with JsonConvert<TestEntity> {
  int? code;
  dynamic? msg;
  TestData? data;
}

class TestData with JsonConvert<TestData> {
  List<TestDataRecords>? records;
  int? total;
  int? size;
  int? current;
  List<dynamic>? orders;
  bool? optimizeCountSql;
  bool? hitCount;
  dynamic? countId;
  dynamic? maxLimit;
  bool? searchCount;
  int? pages;
}

class TestDataRecords with JsonConvert<TestDataRecords> {
  String? id;
  int? mainType;
  int? taskType;
  String? icon;
  String? unitId;
  String? unitName;
  int? status;
  String? createTime;
  String? farmerId;
  String? taskTitle;
  String? taskTypeName;
}
