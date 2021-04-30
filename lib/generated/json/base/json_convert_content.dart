// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_getx_project_template/app/modules/home/models/test_entity.dart';
import 'package:flutter_getx_project_template/generated/json/test_entity_helper.dart';
import 'package:flutter_getx_project_template/app/modules/home/models/user_info_entity.dart';
import 'package:flutter_getx_project_template/generated/json/user_info_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case TestEntity:
				return testEntityFromJson(data as TestEntity, json) as T;
			case TestData:
				return testDataFromJson(data as TestData, json) as T;
			case TestDataRecords:
				return testDataRecordsFromJson(data as TestDataRecords, json) as T;
			case UserInfoEntity:
				return userInfoEntityFromJson(data as UserInfoEntity, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case TestEntity:
				return testEntityToJson(data as TestEntity);
			case TestData:
				return testDataToJson(data as TestData);
			case TestDataRecords:
				return testDataRecordsToJson(data as TestDataRecords);
			case UserInfoEntity:
				return userInfoEntityToJson(data as UserInfoEntity);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (TestEntity).toString()){
			return TestEntity().fromJson(json);
		}	else if(type == (TestData).toString()){
			return TestData().fromJson(json);
		}	else if(type == (TestDataRecords).toString()){
			return TestDataRecords().fromJson(json);
		}	else if(type == (UserInfoEntity).toString()){
			return UserInfoEntity().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<TestEntity>[] is M){
			return data.map<TestEntity>((e) => TestEntity().fromJson(e)).toList() as M;
		}	else if(<TestData>[] is M){
			return data.map<TestData>((e) => TestData().fromJson(e)).toList() as M;
		}	else if(<TestDataRecords>[] is M){
			return data.map<TestDataRecords>((e) => TestDataRecords().fromJson(e)).toList() as M;
		}	else if(<UserInfoEntity>[] is M){
			return data.map<UserInfoEntity>((e) => UserInfoEntity().fromJson(e)).toList() as M;
		}
		throw Exception("not fond");
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}