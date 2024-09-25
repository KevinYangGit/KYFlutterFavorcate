import 'package:ky_flutter_favorcate/core/services/meal_request.dart';
import 'package:ky_flutter_favorcate/core/viewmodel/base_view_model.dart';

class KYMealViewModel extends BaseMealViewModel {
  KYMealViewModel() {
    print('KYMealViewModel() - getMealData');
    KYMealRequest.getMealData().then((value) {
      meals = value;
    });
  }
}
