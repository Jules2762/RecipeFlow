import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/cores/models/meal.dart';
import 'package:test_flutter/cores/providers/meal_favorite_povider.dart';

class MealCard extends StatelessWidget {
  final Meal item;
  final WidgetRef ref;
  const MealCard({super.key, required this.item, required this.ref});
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteMeal);
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              height: 130,
              width: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(item.thumbnail ?? "", fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      IconButton(
                        onPressed: () {
                          toggleFavoriteMeal(ref, item.idMeal);
                        },
                        icon: Icon(
                          favorites.contains(item.idMeal)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: favorites.contains(item.idMeal)
                              ? Colors.red
                              : Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  Text(item.categorie, textAlign: TextAlign.start),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Text(item.categorie)],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
