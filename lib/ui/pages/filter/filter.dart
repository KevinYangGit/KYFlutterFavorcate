import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/core/viewmodel/filter_view_model.dart';
import 'package:provider/provider.dart';

/*
  筛选页面
*/
class KYFilterScreen extends StatelessWidget {
  static final String routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食过滤'),
      ),
      body: Column(
        children: [buildChoiceTitle(), buildChoiceSelect()],
      ),
    );
  }

  Widget buildChoiceTitle() {
    return Container(
      child: Text('展示你的选择'),
    );
  }

  Widget buildChoiceSelect() {
    return Consumer<KYFilterViewModel>(builder: (context, filterVM, child) {
      return Column(
        children: [
          buildListTile('无谷蛋白', false, (value) {
            filterVM.isGlutenFree = value;
          }),
          buildListTile('不含乳糖', false, (value) {
            filterVM.isLactoseFree = value;
          }),
          buildListTile('素食主义', false, (value) {
            filterVM.isVegetarian = value;
          }),
          buildListTile('严格素食主义', false, (value) {
            filterVM.isVegan = value;
          })
        ],
      );
    });
  }

  Widget buildListTile(String title, bool value, Function(bool) onChanged) {
    // 创建一个 ListTile，其中包含一个文本和一个开关
    return ListTile(
      // 设置标题
      title: Text(title),
      // 设置开关
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }
}
