import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/core/extension/int_extension.dart';
import 'package:ky_flutter_favorcate/core/model/meal_model.dart';
import 'package:ky_flutter_favorcate/core/viewmodel/favor_view_model.dart';
import 'package:ky_flutter_favorcate/ui/pages/detail/detail.dart';
import 'package:ky_flutter_favorcate/ui/widgets/operation_item.dart';
import 'package:provider/provider.dart';

/*
  食物卡片
*/
class KYMealItem extends StatelessWidget {
  // 定义一个变量，用于存储传入的 KYMealModel 对象
  final KYMealModel _meal;
  // 构造函数，传入一个 KYMealModel 对象
  const KYMealItem(this._meal, {super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 card 组件实现 阴影+圆角 的卡片效果
    return GestureDetector(
      child: Card(
        // 应用抗锯齿裁剪，比 hardEdge 更平滑（子组件被裁剪到圆角矩形的边界内）
        clipBehavior: Clip.antiAlias,
        // 边距
        margin: EdgeInsets.all(10.px),
        // 阴影效果（模拟了组件在物理世界中的"高度"或"深度"）
        elevation: 5,
        // 圆角（Card 默认圆角12）
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.px)),
        // 子组件垂直排列
        child: Column(
          children: [
            // 图片
            buildBasicInfo(context),
            // 按钮
            buildOperationInfo(context)
          ],
        ),
      ),
      // 点击事件
      onTap: () {
        // 跳转到详情页
        Navigator.of(context).pushNamed(KYDetail.routeName, arguments: _meal);
      },
    );
  }

  // 绘制上半部分（图片+图片信息）
  Widget buildBasicInfo(BuildContext context) {
    // 叠层显示多个组件
    return Stack(
      children: <Widget>[
        // 图片 （ClipRRect 可以指定角切成圆角，因为 Card 有 clipBehavior 属性，所以这里不使用 ClipRRect 了）
        Image.network(_meal.imageUrl,
            width: double.infinity, height: 250.px, fit: BoxFit.cover),
        // 使用 Positioned 定位文本组件
        Positioned(
            right: 10.px,
            bottom: 10.px,
            child: Container(
                width: 300.px,
                // 给 Container 添加背景色、圆角
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(6.px)),
                child: Text(
                  'data',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                )))
      ],
    );
  }

  // 下半部分（时长+难易层度+收藏）
  Widget buildOperationInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 时长
        KYOperationItem(Icon(Icons.schedule), '${_meal.duration}分钟'),
        // 难度
        KYOperationItem(Icon(Icons.restaurant), '${_meal.complexStr}'),
        // 收藏
        buildFavorOperationItem(context)
      ],
    );
  }

  Widget buildFavorOperationItem(BuildContext context) {
    return Consumer<KYFavorViewModel>(
      builder: (context, favorViewModel, child) {
        // 根据收藏状态设置图标
        final iconData = favorViewModel.isFovar(_meal)
            ? Icons.favorite
            : Icons.favorite_border;
        // 根据收藏状态设置颜色
        final iconColor =
            favorViewModel.isFovar(_meal) ? Colors.red : Colors.black;
        // 根据收藏状态设置文字
        final text = favorViewModel.isFovar(_meal) ? '已收藏' : '收藏';
        // 点击事件
        return GestureDetector(
          // 设置点击效果
          child: KYOperationItem(Icon(iconData, color: iconColor), text),
          onTap: () {
            favorViewModel.handleMeal(_meal);
          },
        );
      },
    );
  }
}
