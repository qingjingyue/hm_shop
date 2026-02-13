// 管理路由

import 'package:flutter/material.dart';
import 'package:hm_shop/pages/main/index.dart';
import 'package:hm_shop/pages/login/index.dart';

Widget getRootWidget() {
  return MaterialApp(
    // 默认页面
    initialRoute: '/',
    // 配置路由表
    routes: getRootRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    // 主页
    '/': (context) => const MainPage(),
    // 登录页
    "/login": (context) => const LoginPage(),
  };
}
