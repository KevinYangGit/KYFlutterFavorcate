/*
封装路由
*/

import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/ui/pages/detail/detail.dart';
import 'package:ky_flutter_favorcate/ui/pages/empty/empty.dart';
import 'package:ky_flutter_favorcate/ui/pages/filter/filter.dart';
import 'package:ky_flutter_favorcate/ui/pages/home/home.dart';
import 'package:ky_flutter_favorcate/ui/pages/main/main.dart';
import 'package:ky_flutter_favorcate/ui/pages/meal/meal.dart';

/*
路由配置
*/
class KYRouter {
  // 程序主页面
  static final String initialRoute = KYMainScreen.routeNmae;

  // 路由列表
  // key: 路由名称
  // value: 路由对应的页面
  static final Map<String, WidgetBuilder> routes = {
    KYMainScreen.routeNmae: (ctx) => KYMainScreen(),
    KYEmptyScreeen.routeName: (ctx) => KYEmptyScreeen(),
    KYMealScreen.routeName: (ctx) => KYMealScreen(),
    KYDetail.routeName: (ctx) => KYDetail(),
    KYFilterScreen.routeName: (ctx) => KYFilterScreen()
  };

  // 路由扩展，routes 里没有的路由，可以在这里动态生成
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  // 空页面
  static final RouteFactory unkonwRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) => KYEmptyScreeen());
  };
}
