
/*
{
    "id": 1,
    "name": "Clothes",
    "slug": "clothes",
    "image": "https://placehold.co/600x400"
  }
*/


class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}