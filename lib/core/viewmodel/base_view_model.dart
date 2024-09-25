import 'package:flutter/material.dart';
import 'package:ky_flutter_favorcate/core/model/meal_model.dart';
import 'package:ky_flutter_favorcate/core/viewmodel/filter_view_model.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<KYMealModel> _meals = [];

  late KYFilterViewModel _filterVM;

  void updateFilters(KYFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  List<KYMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  set meals(List<KYMealModel> value) {
    _meals = value;
    notifyListeners();
  }

  get originMeals {
    return _meals;
  }
}
