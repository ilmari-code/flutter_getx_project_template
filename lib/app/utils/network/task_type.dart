/*
 * @Description: 
 * @Autor: ilmari
 * @Date: 2021-04-26 10:21:37
 * @LastEditors: ilmari
 * @LastEditTime: 2021-04-29 16:02:25
 */
typedef AsyncParamTask = Future<TaskResult> Function(String param);
typedef AsyncTask = Future<TaskResult> Function();

enum TaskResult {
  /// 错误 http不是200
  error,

  /// token失效
  tokenTimeout,

  /// 失败 http成功 返回code不为 [ApiState.Success]
  fail,

  /// 成功
  success,

  /// json解析失败
  parseFail,

  /// 连接超时
  timeout,
}
