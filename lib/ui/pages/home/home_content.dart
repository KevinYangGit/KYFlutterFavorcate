import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/core/extension/int_extension.dart';
import 'package:ky_flutter_favorcate/core/model/category_model.dart';
import 'package:ky_flutter_favorcate/core/services/json_parse.dart';
import 'package:ky_flutter_favorcate/ui/pages/home/home_content_item.dart';

/*
 首页内容
*/
class KYHomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 使用 FutureBuilder，先获取数据，再使用获取的数据创建内容
    return FutureBuilder<List<KYCategoryModel>>(
      // 1. 获取数据
      future: KYJsonParse.getCategoryData(),
      // 2. 创建内容
      builder: (context, snapshot) {
        // 数据校验
        // 1. 没有数据，显示loading
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        // 2. 数据错误，提示错误信息
        if (snapshot.error != null) return const Center(child: Text('请求失败'));

        // 3. 拿到数据
        final categores = snapshot.data!;

        // 创建 GridView（类似iOS的 UICollectionView）
        return GridView.builder(
            // 设置上下左右边距
            padding: EdgeInsets.all(20.px),
            // 设置子 widget 的数量
            itemCount: categores.length,
            // 生成 GridView 的数据源代理
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 横轴数量
                crossAxisSpacing: 20.px, // 横轴间距（水平）
                mainAxisSpacing: 20.px, // 主轴间距（垂直）
                childAspectRatio: 1.5 // 宽高比
                ),
            // 创建每行显示的子widget
            itemBuilder: ((context, index) {
              // 返回自定义的子 widget
              return KYHomeContentItem(categores[index]);
            }));
      },
    );
  }
}
