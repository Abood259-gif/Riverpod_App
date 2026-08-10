class ProductModel {
  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.numreviews,
    required this.rating,
  });
  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> image;
  final int numreviews;
  final int rating;
}
