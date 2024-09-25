import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/ui/pages/home/home_content.dart';

/*
 首页
*/
class KYHomeScreen extends StatelessWidget {
  // 路由名称
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 自定义导航栏样式
      appBar: AppBar(
        // 标题
        title: Text("美食广场"),
        // 自定义左侧按钮
        leading: IconButton(
          // 1. 设置图片
          icon: Icon(Icons.build),
          // 2. 添加点击事件
          onPressed: () {
            // 3. 打开菜单
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      // 页面内容
      body: KYHomeScreenContent(),
      // 浮动按钮
      floatingActionButton:
          FloatingActionButton(
            // 1. 给按钮设置图片
            child: Icon(Icons.add), 
            // 2. 添加点击事件
            onPressed: () {
              // TODO
            }),
    );
  }
}
