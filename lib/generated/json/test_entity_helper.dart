import 'package:flutter_getx_project_template/app/modules/home/models/test_entity.dart';

testEntityFromJson(TestEntity data, Map<String, dynamic> json) {
  if (json['code'] != null) {
    data.code = json['code'] is String
        ? int.tryParse(json['code'])
        : json['code'].toInt();
  }
  if (json['msg'] != null) {
    data.msg = json['msg'];
  }
  if (json['data'] != null) {
    data.data = TestData().fromJson(json['data']);
  }
  return data;
}

Map<String, dynamic> testEntityToJson(TestEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  return data;
}

testDataFromJson(TestData data, Map<String, dynamic> json) {
  if (json['records'] != null) {
    data.records = (json['records'] as List)
        .map((v) => TestDataRecords().fromJson(v))
        .toList();
  }
  if (json['total'] != null) {
    data.total = json['total'] is String
        ? int.tryParse(json['total'])
        : json['total'].toInt();
  }
  if (json['size'] != null) {
    data.size = json['size'] is String
        ? int.tryParse(json['size'])
        : json['size'].toInt();
  }
  if (json['current'] != null) {
    data.current = json['current'] is String
        ? int.tryParse(json['current'])
        : json['current'].toInt();
  }
  if (json['orders'] != null) {
    data.orders =
        (json['orders'] as List).map((v) => v).toList().cast<dynamic>();
  }
  if (json['optimizeCountSql'] != null) {
    data.optimizeCountSql = json['optimizeCountSql'];
  }
  if (json['hitCount'] != null) {
    data.hitCount = json['hitCount'];
  }
  if (json['countId'] != null) {
    data.countId = json['countId'];
  }
  if (json['maxLimit'] != null) {
    data.maxLimit = json['maxLimit'];
  }
  if (json['searchCount'] != null) {
    data.searchCount = json['searchCount'];
  }
  if (json['pages'] != null) {
    data.pages = json['pages'] is String
        ? int.tryParse(json['pages'])
        : json['pages'].toInt();
  }
  return data;
}

Map<String, dynamic> testDataToJson(TestData entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['records'] = entity.records?.map((v) => v.toJson())?.toList();
  data['total'] = entity.total;
  data['size'] = entity.size;
  data['current'] = entity.current;
  data['orders'] = entity.orders;
  data['optimizeCountSql'] = entity.optimizeCountSql;
  data['hitCount'] = entity.hitCount;
  data['countId'] = entity.countId;
  data['maxLimit'] = entity.maxLimit;
  data['searchCount'] = entity.searchCount;
  data['pages'] = entity.pages;
  return data;
}

testDataRecordsFromJson(TestDataRecords data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['mainType'] != null) {
    data.mainType = json['mainType'] is String
        ? int.tryParse(json['mainType'])
        : json['mainType'].toInt();
  }
  if (json['taskType'] != null) {
    data.taskType = json['taskType'] is String
        ? int.tryParse(json['taskType'])
        : json['taskType'].toInt();
  }
  if (json['icon'] != null) {
    data.icon = json['icon'].toString();
  }
  if (json['unitId'] != null) {
    data.unitId = json['unitId'].toString();
  }
  if (json['unitName'] != null) {
    data.unitName = json['unitName'].toString();
  }
  if (json['status'] != null) {
    data.status = json['status'] is String
        ? int.tryParse(json['status'])
        : json['status'].toInt();
  }
  if (json['createTime'] != null) {
    data.createTime = json['createTime'].toString();
  }
  if (json['farmerId'] != null) {
    data.farmerId = json['farmerId'].toString();
  }
  if (json['taskTitle'] != null) {
    data.taskTitle = json['taskTitle'].toString();
  }
  if (json['taskTypeName'] != null) {
    data.taskTypeName = json['taskTypeName'].toString();
  }
  return data;
}

Map<String, dynamic> testDataRecordsToJson(TestDataRecords entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['mainType'] = entity.mainType;
  data['taskType'] = entity.taskType;
  data['icon'] = entity.icon;
  data['unitId'] = entity.unitId;
  data['unitName'] = entity.unitName;
  data['status'] = entity.status;
  data['createTime'] = entity.createTime;
  data['farmerId'] = entity.farmerId;
  data['taskTitle'] = entity.taskTitle;
  data['taskTypeName'] = entity.taskTypeName;
  return data;
}
