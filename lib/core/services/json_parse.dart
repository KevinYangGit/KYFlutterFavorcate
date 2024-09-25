import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ky_flutter_favorcate/core/model/category_model.dart';
import 'package:ky_flutter_favorcate/core/model/meal_model.dart';

class KYJsonParse {
  static Future<List<KYCategoryModel>> getCategoryData() async {
    // 1.加在json文件
    String jsonString =
        await rootBundle.loadString('assets/json/category.json');

    // 2.将jsonString转成Map/List
    // 问题：decode 期望的是 string 类型，loadString() 返回的是 Future<String> 类型
    // 解决：将函数声明为async，并使用await来等待Future完成，并获取结果
    final result = json.decode(jsonString);

    // 3.字典转模型
    final resultList = result['category'];
    List<KYCategoryModel> categores = [];
    for (var json in resultList) {
      categores.add(KYCategoryModel.fromJson(json));
    }
    return categores;
  }

  static Future<List<KYMealModel>> getMealData() async {
    print('----');
    String jsonString = await rootBundle.loadString('assets/json/meals.json');
    print('****');
    final result = json.decode(jsonString);
    final mealArray = result['meal'];
    List<KYMealModel> meals = [];

    for (var json in mealArray) {
      meals.add(KYMealModel.fromJson(json));
    }
    return meals;
  }
}
