import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/core/model/category_model.dart';
import 'package:ky_flutter_favorcate/ui/pages/meal/meal_content.dart';

/*
  菜单页面
*/
class KYMealScreen extends StatelessWidget {
  // 路由名称
  static const String routeName = '/meal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('菜单'),
      ),
      body: KYMealContent(),
    );
  }
}
