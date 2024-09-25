import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ky_flutter_favorcate/core/extension/int_extension.dart';
import 'package:ky_flutter_favorcate/core/model/meal_model.dart';
import 'package:ky_flutter_favorcate/ui/shared/size_fit.dart';

class KYDetail extends StatelessWidget {
  static final String routeName = '/detial';

  late final KYMealModel _meal;

  @override
  Widget build(BuildContext context) {
    _meal = ModalRoute.of(context)?.settings.arguments as KYMealModel;
    print(_meal.ingredients);
    return Scaffold(
      appBar: AppBar(title: Text('详情')),
      body: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle('制作材料'),
          buildMakeMaterial(context),
          buildMakeTitle('制作步骤'),
          buildMakeSteps(context)
        ],
      ),
    );
  }

  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
      child: Image.network(_meal.imageUrl),
    );
  }

  Widget buildMakeTitle(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(title),
    );
  }

  Widget buildMakeMaterial(BuildContext context) {
    print(_meal.ingredients);
    return Container(
      padding: EdgeInsets.all(8.px),
      width: KYSizeFit.screenWidth - 40.px,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.px),
      ),
      child: ListView.builder(
          // 去掉底部会有空余部分
          padding: EdgeInsets.zero,
          // 根据内容大小来调整列表的尺寸
          shrinkWrap: true,
          // 设置不支持滚动
          physics: NeverScrollableScrollPhysics(),
          itemCount: _meal.ingredients.length,
          itemBuilder: (constext, index) {
            return Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Text(_meal.ingredients[index])),
            );
          }),
    );
  }

  Widget buildMakeSteps(BuildContext context) {
    return Container(
      width: KYSizeFit.screenWidth - 30.px,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.px)),
      child: ListView.separated(
          padding: EdgeInsets.zero,
          // 根据内容大小来调整列表的尺寸
          shrinkWrap: true,
          // 设置不支持滚动
          physics: NeverScrollableScrollPhysics(),
          itemCount: _meal.steps.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}',
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              title: Text(
                _meal.steps[index],
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          }),
    );
  }
}
