import 'package:dio/dio.dart';
import 'package:test_flutter/cores/models/category.dart';

class CategoryService {
  final Dio dio;
  CategoryService(this.dio);
  
  Future<List<Category>> getCategories() async {
    final response = await dio.get("/categories.php");
    final data = response.data["categories"] as List;
    return data.map((e) => Category.fromJson(e)).toList();
  }
}
