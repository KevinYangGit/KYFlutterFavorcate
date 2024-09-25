import 'package:flutter/material.dart';

/*
 自定义主题
*/
class KYAppTheme {
  // 1.公共属性
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;
  static const double xLargeFontSize = 30;

  // 普通模式
  static final ThemeData normalTheme = ThemeData(
      // 1.亮度：light/dark（暗黑模式）
      brightness: Brightness.light,
      // （【已经淘汰】primarySwatch：primaryColor/accentColor的结合体）
      // 2.primaryColor：导航/底部TabBar的颜色（The background color for major parts of the app (toolbars, tab bars, etc)）
      primaryColor: Colors.pink,
      // 3.导航栏
      appBarTheme: const AppBarTheme(
          // 导航栏标题字体颜色
          foregroundColor: Colors.white,
          // 导航栏背景颜色
          backgroundColor: Colors.pink),
      // 4.底部tabbar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          // 选中 item 的颜色
          selectedItemColor: Colors.pink),
      // 5.设置悬浮按钮颜色
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          // 图片颜色
          foregroundColor: Colors.white,
          // 背景颜色
          backgroundColor: Colors.pink),
      // 6.文本颜色（标题/正文）
      textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: largeFontSize, color: Colors.black87),
          bodyMedium:
              TextStyle(fontSize: normalFontSize, color: Colors.black87),
          bodySmall:
              TextStyle(fontSize: smallFontSize, color: Colors.black87)));
}
