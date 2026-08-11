import 'package:flutter/foundation.dart';
/*
 {
    "id": 4,
    "title": "Handmade Fresh Table",
    "slug": "handmade-fresh-table",
    "price": 687,
    "description": "Andy shoes are designed to keeping in...",
    "category": {
      "id": 5,
      "name": "Others",
      "image": "https://placehold.co/600x400",
      "slug": "others"
    },
    "images": [
      "https://placehold.co/600x400",
      "https://placehold.co/600x400",
      "https://placehold.co/600x400"
    ]
  }
*/
class ProductModel   {
  final int id;
    final String name;
    final String slug;
    final double price;
    final String description;
    final List<String> image;
    final String categoryName;

  ProductModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    required this.description,
    required this.image,
    required this.categoryName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<String> parsedImages = [];
  try {
    if (json['images'] != null) {
      parsedImages = List<String>.from(json['images'].map((x) => x.toString()));
    }
  } catch (e) {
    parsedImages = ['https://placehold.co/600x400']; // صورة افتراضية عند الفشل
  }
  
    return ProductModel(
      id: json['id'],
      name: json['title'],
      slug: json['slug'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      image: List<String>.from(json['images']),
      categoryName: json['category']['name'],
    );
  }
}
