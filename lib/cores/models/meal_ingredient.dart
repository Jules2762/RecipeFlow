class MealIngredient {
  final String mealId;
  final String ingredientId;
  final String? measure;
  const MealIngredient({
    required this.mealId,
    required this.ingredientId,
    this.measure,
  });
  factory MealIngredient.fromJson(Map<String, dynamic> json) {
    return MealIngredient(
      mealId: json[""],
      ingredientId: json[""],
      measure: json[""],
    );
  }
}
