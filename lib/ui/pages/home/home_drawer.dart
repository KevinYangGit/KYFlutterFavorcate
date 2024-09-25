import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/core/extension/int_extension.dart';
import 'package:ky_flutter_favorcate/ui/pages/filter/filter.dart';

/*
 首页菜单
*/
class KYHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 设置宽度
      width: 250.px,
      // 设置背景色
      color: Colors.white,
      // 垂直排列子widget
      child: Column(
        // 子widget
        children: [
          // 自定义菜单 header
          buildHeaderView(context),
          // 添加‘进餐’选项
          buildListTile(Icon(Icons.restaurant), '进餐', () {
            Navigator.of(context).pop();
          }),
          // 添加‘过滤’选项
          buildListTile(Icon(Icons.settings), '过滤', () {
            Navigator.of(context).pushNamed(KYFilterScreen.routeName);
          })
        ],
      ),
    );
  }

  // 菜单的顶部样式
  Widget buildHeaderView(BuildContext context) {
    return Container(
      // 设置宽度，充满父 widget 宽度
      width: double.infinity,
      // 设置高度
      height: 120.px,
      // 设置背景色
      color: Colors.orange,
      // 设置边距
      margin: EdgeInsets.only(bottom: 20.px),
      // 设置子 widget 居中
      /*
      x: 水平方向的对齐比例，范围从 0.0（左对齐）到 1.0（右对齐）。
      y: 垂直方向的对齐比例，范围从 0.0（顶部对齐）到 1.0（底部对齐）。
      */
      alignment: Alignment(0, 0.5),
      // 内容（获取主题样式使用用 Theme.of(context).textTheme）
      child: Text('开始动手', style: Theme.of(context).textTheme.bodySmall),
    );
  }

  // 每行显示的选项
  // BUG：老版本定义回到函数用的是 Function，新版本改为 Function()
  /*
   icon: 图标
   title: 标题
   handler: 回调函数
  */
  Widget buildListTile(Widget icon, String title, Function() handler) {
    // 创建 ListTile 作为每行的选项
    return ListTile(
      // 设置左侧图标
      leading: icon,
      // 设置标题
      title: Text(title),
      // 添加点击事件，通过 handler 回调出去
      onTap: handler,
    );
  }
}
