import 'package:flutter/material.dart';

/*
* 适配类
*/
class KYSizeFit {
  // 1.基本信息
  static double physicalWidth = 0;
  static double physicalHeight = 0;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double dpr = 0;
  static double statusHeight = 0;

  static double rpx = 0;
  static double px = 0;

  static void initialize(BuildContext context, {double standarSize = 750}) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // 1.手机的物理分辨率
    physicalWidth = View.of(context).physicalSize.width;
    physicalHeight = View.of(context).physicalSize.height;

    // iphoneXs: physicalWidth: 1125.0, physicalHeight: 2436.0
    print('physicalWidth: $physicalWidth, physicalHeight: $physicalHeight');
    // 2.获取dpr
    dpr = mediaQueryData.devicePixelRatio;

    // 3.屏幕宽度和高度
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    // iphoneXs: screenWidth: 375.0, screenHeight: 812.0
    print('screenWidth: $screenWidth, screenHeight: $screenHeight');

    // 4.状态栏高度
    statusHeight = mediaQueryData.padding.top / dpr;

    // 5.计算 rpx 的大小
    rpx = screenWidth / standarSize;
    px = screenWidth / standarSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}
