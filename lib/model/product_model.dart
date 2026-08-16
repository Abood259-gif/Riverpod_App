import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_app/model/categorymodel.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';


List<String> _parseImages(dynamic rawImages) {
  if (rawImages == null || rawImages is! List) return ['https://placehold.co/600x400'];
  return rawImages
      .where((item) => item != null)
      .map((item) => item.toString())
      .toList();
}

@freezed
 abstract class ProductModel with _$ProductModel   {
  const factory ProductModel({
    required int id ,
    required String name,
    required String slug,
    required double price,
  required   String description,
   @JsonKey(fromJson: _parseImages) @Default([]) List<String> images,
    required CategoryModel category,
  }) = _ProductModel;




factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
