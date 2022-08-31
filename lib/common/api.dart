import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/models/index.dart';
import 'Global.dart';
export 'package:dio/dio.dart' show DioError;

class Store {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  Store([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext? context;
  late Options _options;
  static Dio dio = Dio(BaseOptions(
    baseUrl: 'http://127.0.0.1:8000/',
    // headers: {
    //   HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
    //       "application/vnd.github.symmetra-preview+json",
    // },
  ));

  static void init() {
    // 添加缓存插件
    // dio.interceptors.add(Global.netCache);
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    // if (!Global.isRelease) {
    //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //       (client) {
    //     // client.findProxy = (uri) {
    //     //   return 'PROXY 192.168.50.154:8888';
    //     // };
    //     //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    //   };
    // }
  }

  // 登录接口，登录成功后返回用户信息
  Future<User> login(String username, String pwd) async {
    // String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
    Map<String, dynamic> loginReq = {
      'username': username,
      'password': pwd
    }; //直接赋值初始值
    var r = await dio.get(
      "/login",
      queryParameters: loginReq,
      // options: _options.copyWith(headers: {
      //   HttpHeaders.authorizationHeader: basic
      // }, extra: {
      //   "noCache": true, //本接口禁用缓存
      // }),
    );
    //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    // dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    //清空所有缓存
    // Global.netCache.cache.clear();
    //更新profile中的token信息
    print(r);
    // Global.profile.token = basic;
    return User.fromJson(r.data);
  }
}

  //获取用户项目列表
//   Future<List<Product>> getRepos({
//     Map<String, dynamic>? queryParameters, //query参数，用于接收分页信息
//     refresh = false,
//   }) async {
//     if (refresh) {
//       // 列表下拉刷新，需要删除缓存（拦截器中会读取这些信息）
//       _options.extra!.addAll({"refresh": true, "list": true});
//     }
//     var r = await dio.get<List>(
//       "user/repos",
//       queryParameters: queryParameters,
//       options: _options,
//     );
//     return r.data!.map((e) => Repo.fromJson(e)).toList();
//   }
//}