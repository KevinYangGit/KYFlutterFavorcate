import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/ui/pages/favor/favor.dart';
import 'package:ky_flutter_favorcate/ui/pages/home/home.dart';
import 'package:ky_flutter_favorcate/ui/pages/home/home_drawer.dart';
import 'package:ky_flutter_favorcate/ui/pages/main/initialize_item.dart';

class KYMainScreen extends StatefulWidget {
  // 路由名称
  static const String routeNmae = "/";
  @override
  State<KYMainScreen> createState() => _KYMainScreenState();
}

class _KYMainScreenState extends State<KYMainScreen> {
  // 记录当前页
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      // 首页菜单（首页菜单没有放在 home.dart 里，而是放在了 main.dart 里，可以实现菜单栏在页面的最上面，包括在 tabbar 的上面）
      drawer: KYHomeDrawer(),
      // 页面
      body: IndexedStack(
        // 1. 当前页面
        index: _currentIndex,
        // 2. 添加需要包含的页面（首页 + 收藏页）
        children: pages,
      ),
      // 底部 tabbar
      bottomNavigationBar: BottomNavigationBar(
        // 1. 默认页
        currentIndex: _currentIndex,
        // 2. 设置 tab 按钮，（首页 + 收藏页）
        items: items,
        // 3. 点击 tabbar
        onTap: (index) {
          // 4. 刷新页面状态
          setState(() {
            // 5. 修改当前页面id
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
