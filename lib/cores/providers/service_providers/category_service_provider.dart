import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/cores/network/dio_provider.dart';
import 'package:test_flutter/cores/services/category_service.dart';


final categoryServiceProvider = Provider<CategoryService>((ref) {
  final dio = ref.read(dioProvider);
  return CategoryService(dio);
});