import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/core/model/meal_model.dart';
import 'package:ky_flutter_favorcate/core/viewmodel/favor_view_model.dart';
import 'package:ky_flutter_favorcate/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

/*
  菜单收藏页面
*/
class KYFavorScreen extends StatelessWidget {
  static const String routeName = '/favor';

  @override
  Widget build(BuildContext context) {
    return Consumer<KYFavorViewModel>(
      builder: (context, favorVM, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('收藏'),
          ),
          body: Center(
            child: ListView.builder(
                itemCount: favorVM.meals.length,
                itemBuilder: (context, index) {
                  return KYMealItem(favorVM.meals[index]);
                }),
          ),
        );
      },
    );
  }
}
