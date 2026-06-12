class Meal {
  final String idMeal;
  final String name;
  final String categorie;
  final String? area;
  final String? contry;
  final String? instructions;
  final String? thumbnail;
  final String? tags;
  final String? youtube;
  final String? source;
  final String? imageSource;
  final String? modifiedAt;

  const Meal({
    required this.idMeal,
    required this.name,
    required this.categorie,
    this.area,
    this.contry,
    this.instructions,
    this.thumbnail,
    this.tags,
    this.youtube,
    this.source,
    this.imageSource,
    this.modifiedAt,
  });
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json["idMeal"],
      name: json["strMeal"],
      categorie: json["strCategory"],
      area: json["strArea"],
      contry: json["strCountry"],
      instructions: json["strInstructions"],
      thumbnail: json["strMealThumb"],
      tags: json["strTags"],
      youtube: json["strYoutube"],
      source: json["strSource"],
      imageSource: json["strImageSource"],
      modifiedAt: json["dateModified"],
    );
  }
}
