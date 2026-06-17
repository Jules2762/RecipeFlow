import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/cores/providers/data_providers/meal_data_provider.dart';
import 'package:test_flutter/cores/providers/meal_favorite_povider.dart';
import 'package:test_flutter/views/widgets/meal_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, ref, child) {
          final meals = ref.watch(mealDataProvider(""));
          final favorites = ref.watch(
            favoriteMeal,
          ); //favoritesMeal =set<string> des id
          return meals.when(
            data: (data) {
              return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: ((context, index) {
                  final filteredMeal = data
                      .where((e) => favorites.contains(e.idMeal))
                      .toList();
                  final item = filteredMeal[index];
                  return MealCard(item: item, ref: ref);
                }),
              );
            },
            error: (error, _) => Text("error"),
            loading: () => Text("loading"),
          );
        },
      ),
    );
  }
}
