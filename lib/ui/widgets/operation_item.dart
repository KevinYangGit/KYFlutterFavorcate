import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/core/extension/int_extension.dart';

/*
  操作项
  - 图标
  - 文案
*/
class KYOperationItem extends StatelessWidget {
  // 图标
  final Icon _icon;
  // 文案
  final String _text;
  // 构造方法
  const KYOperationItem(this._icon, this._text, {super.key});

  // 加在页面
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.px,
      // 边距，使用 symmetric 创建了一个在垂直方向（上和下）具有相同空间大小的 EdgeInsets 对象
      padding: EdgeInsets.symmetric(vertical: 12.px),
      // 水平排列子组件
      child: Row(
        // 水平居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon,
          // 间隔
          SizedBox(width: 3.px),
          Text(_text, style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}
