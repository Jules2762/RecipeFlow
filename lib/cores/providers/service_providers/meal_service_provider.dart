import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/cores/network/dio_provider.dart';
import 'package:test_flutter/cores/services/meal_service.dart';

final mealServiceProvider = Provider<MealService>((ref) {
  final dio = ref.read(dioProvider);
  return MealService(dio);
});
