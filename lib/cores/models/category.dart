class Category {
  final String idCategory;
  final String name;
  final String thumbnail;
  final String description;
  const Category({
    required this.idCategory,
    required this.name,
    required this.thumbnail,
    required this.description,
  });
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      idCategory:json["idCategory"],
      name: json["strCategory"],
      thumbnail: json["strCategoryThumb"],
      description:json["strCategoryDescription"] 
    );
  }
}
