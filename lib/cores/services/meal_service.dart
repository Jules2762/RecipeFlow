import 'package:dio/dio.dart';
import 'package:test_flutter/cores/models/meal.dart';

class MealService {
  final Dio dio;
  MealService(this.dio);
  Future<List<Meal>> getMeals(String? name) async {
    final response = await dio.get("/search.php", queryParameters: {"s": name});
    final data = response.data["meals"];
    if (data is List) {
      return data.map((e) => Meal.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
