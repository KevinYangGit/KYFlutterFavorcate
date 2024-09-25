import 'package:ky_flutter_favorcate/core/model/meal_model.dart';
import 'package:ky_flutter_favorcate/core/services/http_request.dart';

class KYMealRequest {
  static Future<List<KYMealModel>> getMealData() async {
    // 1. 请求地址
    final url = '/meals';
    // final url = 'http://172.24.2.41/meals';
    // 2. 发送网络请求
    // BUG：忘记写 await 了，导致没有等到返回结果就直接执行返回代码了
    final result = await KYHttpRequest.request(url);
    // 3. 数据解析
    final mealArray = result['meal'];
    print('KYMealRequest - getMealData - result: $result');
    List<KYMealModel> meals = [];
    for (var json in mealArray) {
      meals.add(KYMealModel.fromJson(json));
    }
    return meals;
  }
}
