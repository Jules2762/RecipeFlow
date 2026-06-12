import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/cores/models/category.dart';
import 'package:test_flutter/cores/providers/service_providers/category_service_provider.dart';


final categoriesDataProvider =
    FutureProvider<List<Category>>((ref) async {
  final service = ref.read(categoryServiceProvider);
  return service.getCategories();
});