import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/core/extension/int_extension.dart';
import 'package:ky_flutter_favorcate/core/model/category_model.dart';
import 'package:ky_flutter_favorcate/ui/pages/meal/meal.dart';

/*
  首页内容项
*/
class KYHomeContentItem extends StatelessWidget {
  // 设置
  final KYCategoryModel _categoryModel;
  const KYHomeContentItem(this._categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    // 添加手势
    return GestureDetector(
      child: Container(
        // 自定义样式
        decoration: BoxDecoration(
            // 1. 圆角
            borderRadius: BorderRadius.circular(20.px),
            // 2. 渐变色
            gradient: LinearGradient(colors: [
              _categoryModel.cColor.withOpacity(0.5),
              _categoryModel.cColor
            ])),
        // 设置居中显示
        alignment: Alignment.center,
        // 添加文案，style 可以设置 Text 的文字样式
        child: Text(_categoryModel.title ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
      ),
      // 添加手势的点击事件
      onTap: () {
        // 跳转到详情页面 KYMealScreen 页，传递参数 _categoryModel
        Navigator.of(context)
            .pushNamed(KYMealScreen.routeName, arguments: _categoryModel);
      },
    );
  }
}
