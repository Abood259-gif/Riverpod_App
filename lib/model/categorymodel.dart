/*
{
    "id": 1,
    "name": "Clothes",
    "slug": "clothes",
    "image": "https://placehold.co/600x400"
  }
*/

import 'package:freezed_annotation/freezed_annotation.dart';
part 'categorymodel.freezed.dart';
part 'categorymodel.g.dart';

@freezed
 abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    required String slug,
    required String image,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

 
  
}
