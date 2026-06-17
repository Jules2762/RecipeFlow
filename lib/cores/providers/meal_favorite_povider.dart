import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final favoriteMeal = StateProvider<Set<String>>((ref) => {});

void toggleFavoriteMeal(WidgetRef ref, String idMeal) {
  final favorite = {...ref.watch(favoriteMeal)};
  if (favorite.contains(idMeal)) {
    favorite.remove(idMeal);
  } else {
    favorite.add(idMeal);
  }
  ref.read(favoriteMeal.notifier).state = favorite;
}
