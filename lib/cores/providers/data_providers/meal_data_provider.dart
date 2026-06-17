import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/cores/models/meal.dart';
import 'package:test_flutter/cores/providers/service_providers/meal_service_provider.dart';

final mealDataProvider = FutureProvider.family<List<Meal>,String?>((ref,name) async {
  final service = ref.read(mealServiceProvider);
  return service.getMeals(name);
});
