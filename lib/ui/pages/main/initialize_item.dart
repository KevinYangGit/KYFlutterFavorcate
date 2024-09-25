/*
封装 NavigationBarItem
*/

import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/ui/pages/favor/favor.dart';
import 'package:ky_flutter_favorcate/ui/pages/home/home.dart';

// 页面数组，首页 + 收藏页
final List<Widget> pages = [KYHomeScreen(), KYFavorScreen()];

// tabItem 数组
final List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
  const BottomNavigationBarItem(icon: Icon(Icons.star), label: '收藏')
];
