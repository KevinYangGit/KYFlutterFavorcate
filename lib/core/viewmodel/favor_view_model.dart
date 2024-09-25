
import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/core/model/meal_model.dart';
import 'package:ky_flutter_favorcate/core/viewmodel/base_view_model.dart';

class KYFavorViewModel extends BaseMealViewModel {
  void addMeal(KYMealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(KYMealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(KYMealModel meal) {
    if (isFovar(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }

  bool isFovar(KYMealModel meal) {
    for (KYMealModel e in originMeals) {
      if (e.id == meal.id) return true;
    }
    return false;
  }
}
