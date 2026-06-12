class Ingredient {
  final String idIngredient;
  final String name;
  final String? description;
  final String? type;
  final String? thumbnail;
  const Ingredient({
    required this.idIngredient,
    required this.name,
    this.description,
    this.type,
    this.thumbnail
  });
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      idIngredient: json["idIngredient"],
      name: json["strIngredient"],
      description: json["strDescription"],
      type: json["strType"],
      thumbnail: json["strThumb"]
    );
  }
}
