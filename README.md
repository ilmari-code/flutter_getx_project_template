# flutter_getx_project_template

基于 GetX 的 Flutter 项目模板

## 目录结构

```
├── lib //项目代码根目录
│   ├── app
│   │   ├── common
│   │   │   └── common.dart
│   │   ├── config
│   │   │   ├── application.dart
│   │   │   └── constants.dart
│   │   ├── data
│   │   ├── lang //国际化语言资源
│   │   │   ├── en_US.dart //英文
│   │   │   ├── translation_service.dart //配置文件
│   │   │   └── zh_CN.dart //中文
│   │   ├── modules //各个功能模块
│   │   │   ├── features
│   │   │   │   ├── bindings
│   │   │   │   │   └── features_binding.dart
│   │   │   │   ├── controllers
│   │   │   │   │   └── features_controller.dart
│   │   │   │   └── views
│   │   │   │       └── features_view.dart
│   │   │   ├── home
│   │   │   │   ├── bindings
│   │   │   │   │   └── home_binding.dart
│   │   │   │   ├── controllers
│   │   │   │   │   └── home_controller.dart
│   │   │   │   ├── models
│   │   │   │   │   ├── test.dart
│   │   │   │   │   ├── test_entity.dart
│   │   │   │   │   └── user_info_entity.dart
│   │   │   │   ├── service
│   │   │   │   │   ├── api.dart
│   │   │   │   │   └── service.dart
│   │   │   │   └── views
│   │   │   │       └── home_page.dart
│   │   │   ├── index
│   │   │   │   ├── bindings
│   │   │   │   │   └── index_binding.dart
│   │   │   │   ├── controllers
│   │   │   │   │   └── index_controller.dart
│   │   │   │   └── views
│   │   │   │       └── index_page.dart
│   │   │   └── mine
│   │   │       ├── bindings
│   │   │       │   ├── change_language_binding.dart
│   │   │       │   ├── change_theme_binding.dart
│   │   │       │   └── mine_binding.dart
│   │   │       ├── controllers
│   │   │       │   ├── change_language_controller.dart
│   │   │       │   ├── change_theme_controller.dart
│   │   │       │   └── mine_controller.dart
│   │   │       ├── models
│   │   │       └── views
│   │   │           ├── change_language_page.dart
│   │   │           ├── change_theme_page.dart
│   │   │           └── mine_page.dart
│   │   ├── plugins
│   │   │   ├── options
│   │   │   │   ├── options.dart
│   │   │   │   ├── scales.dart //屏幕适配
│   │   │   │   └── themes.dart //主题配置
│   │   │   └── other
│   │   │       └── eventbus //全局通知
│   │   ├── resource
│   │   │   ├── dimens.dart //适配大小
│   │   │   └── resource_colors.dart //常用颜色
│   │   ├── routes
│   │   │   ├── 404.dart //404页面
│   │   │   ├── app_routes.dart //路由配置
│   │   │   ├── feature_routes.dart //子模块路由
│   │   │   ├── home_route.dart //子模块路由
│   │   │   ├── mine_route.dart //子模块路由
│   │   │   └── utils
│   │   │       └── get_navigator.dart //路由跳转
│   │   ├── utils
│   │   │   ├── extensions
│   │   │   │   ├── extension_color.dart //颜色类扩展
│   │   │   │   └── extension_text.dart //Text类扩展
│   │   │   ├── keep_alive_page.dart //页面保活功能类
│   │   │   ├── log
│   │   │   │   └── log.dart //日志打印
│   │   │   ├── network  //网络请求相关
│   │   │   │   ├── async_task.dart
│   │   │   │   ├── dio
│   │   │   │   │   ├── call_setting.dart
│   │   │   │   │   ├── callback.dart
│   │   │   │   │   ├── dio_creator.dart
│   │   │   │   │   ├── dio_provider.dart
│   │   │   │   │   ├── executor.dart
│   │   │   │   │   ├── result_entity.dart
│   │   │   │   │   ├── state.dart
│   │   │   │   │   └── transformer.dart
│   │   │   │   ├── http_util.dart
│   │   │   │   ├── http_utils.dart
│   │   │   │   ├── inteceptor
│   │   │   │   │   ├── log_inteceptor.dart
│   │   │   │   │   └── sign_interceptor.dart
│   │   │   │   ├── network.dart
│   │   │   │   └── task_type.dart
│   │   │   ├── object_util.dart
│   │   │   ├── sp_utils //GetStorage 数据持久化
│   │   │   │   └── sp_utils.dart
│   │   │   └── toast
│   │   │       └── toast.dart
│   │   └── widget
│   │       ├── custom_type.dart
│   │       ├── image_widget.dart
│   │       └── state
│   │           ├── empty_widget.dart
│   │           └── state_widget.dart
│   ├── gen_a //使用FlutterAddImage插件，配置图片资源Path
│   │   └── A.dart
│   ├── generated //JsonToDartBeanAction插件，生成Bean类模型
│   │   └── json
│   │       ├── base
│   │       │   ├── json_convert_content.dart
│   │       │   └── json_field.dart
│   │       ├── test_entity_helper.dart
│   │       └── user_info_entity_helper.dart
│   ├── generated_plugin_registrant.dart
│   └── main.dart //项目入口文件
```
