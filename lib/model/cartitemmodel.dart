

import 'package:responsive_app/model/product_model.dart';

class CartItemModel {
 ProductModel product;
  int quantity;
  bool isSelected;

  CartItemModel({
   required this.product,
    this.quantity = 1,
    this.isSelected = false,
  });
}