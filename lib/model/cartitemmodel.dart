import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_app/model/product_model.dart';

part 'cartitemmodel.freezed.dart';

@freezed
abstract  class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required ProductModel product,
    @Default(1) int quantity,
    @Default(false) bool isSelected,
  }) = _CartItemModel;
}
