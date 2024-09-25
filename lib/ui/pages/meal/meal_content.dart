import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ky_flutter_favorcate/core/model/category_model.dart';
import 'package:ky_flutter_favorcate/core/model/meal_model.dart';
import 'package:ky_flutter_favorcate/core/viewmodel/meal_view_model.dart';
import 'package:ky_flutter_favorcate/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

/*
* 菜单内容页面
*/
class KYMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1.获取页面传值
    final category =
        ModalRoute.of(context)?.settings.arguments as KYCategoryModel;

    // 2.异步获取数据
    return Selector<KYMealViewModel, List<KYMealModel>>(
        selector: (context, mealVM) {
          print('meals: ${mealVM.meals}');
          // 4.过滤出当前类别的数据
          return mealVM.meals.where((element) {
            return element.categories.contains(category.id);
          }).toList();
        },
        builder: (context, meals, child) {
          // 5.创建列表
          return ListView.builder(
              // 列表长度
              itemCount: meals.length,
              // 返回列表每一行的 item
              itemBuilder: (context, index) {
                return KYMealItem(meals[index]);
              });
        },
        // 3.监听数据变化，根据数据变化重新构建
        shouldRebuild: (previous, next) => !listEquals(previous, next));
  }
}
