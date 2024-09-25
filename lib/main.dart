/*
Theme分为：全局Theme和局部Theme
主题有两个作用：
设置了主题之后，某些Widget会自动使用主题的样式（比如AppBar的颜色）
将某些样式放到主题中统一管理，在应用程序的其它地方直接引用
*/

import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/core/router/router.dart';
import 'package:ky_flutter_favorcate/core/viewmodel/favor_view_model.dart';
import 'package:ky_flutter_favorcate/core/viewmodel/filter_view_model.dart';
import 'package:ky_flutter_favorcate/core/viewmodel/meal_view_model.dart';
import 'package:ky_flutter_favorcate/ui/shared/app_theme.dart';
import 'package:ky_flutter_favorcate/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

void main() {
  /*
  在使用Provider的时候，我们主要关心三个概念：
  ChangeNotifier：真正数据（状态）存放的地方；
  ChangeNotifierProvider：Widget树中提供数据（状态）的地方，会在其中创建对应的ChangeNotifier；
  Consumer：Widget树中需要使用数据（状态）的地方。
  */
  runApp(
    // 在多个 Provider 之间共享数据
    MultiProvider(providers: [
      // 全局的 KYFilterViewModel
    ChangeNotifierProvider(create: (ctx) => KYFilterViewModel()),
    /*
    ChangeNotifierProxyProvider 是 ChangeNotifierProvider 的子类，
    它允许我们在创建 ChangeNotifierProvider 时，根据已有的 ChangeNotifierProvider 创建新的 ChangeNotifierProvider
    */
    // 依赖 KYFilterViewModel 的 KYMealViewModel
    ChangeNotifierProxyProvider<KYFilterViewModel, KYMealViewModel>(
        create: (ctx) => KYMealViewModel(),
        update: (ctx, filterVM, mealVM) {
          mealVM?.updateFilters(filterVM);
          return mealVM!;
        }),
    // 依赖 KYMealViewModel 的 KYFavorViewModel
    ChangeNotifierProxyProvider<KYFilterViewModel, KYFavorViewModel>(
        create: (ctx) => KYFavorViewModel(),
        update: (ctx, filterVM, favorVM) {
          favorVM?.updateFilters(filterVM);
          return favorVM!;
        })
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    KYSizeFit.initialize(context);

    return MaterialApp(
      // 在 Android 设备上，应用后台显示的名称
      title: '美食广场',
      /* 
      全局主题，全局Theme会影响整个app的颜色和字体样式。
      */
      theme: KYAppTheme.normalTheme,
      /* 
      路由 
      */
      // 1.以路由的方式设置主页面
      initialRoute: KYRouter.initialRoute,
      // 2.实现 routes 的同时，必须实现 onGenerateRoute 和 onUnknownRoute
      routes: KYRouter.routes,
      // 3.routes 不支持的路由，可以动态生成页面
      onGenerateRoute: KYRouter.generateRoute,
      // 4.routes 和 onGenerateRoute 都不支持的路由，跳转到异常页面
      onUnknownRoute: KYRouter.unkonwRoute,
    );
  }
}
