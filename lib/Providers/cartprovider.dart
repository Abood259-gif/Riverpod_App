import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app/model/cartitemmodel.dart';
import 'package:responsive_app/model/product_model.dart';

class Cartprovider extends Notifier<List<CartItemModel>> {
  @override
  List<CartItemModel> build() {
    return [];
  }

  void addProduct(ProductModel product) {
    final index = state.indexWhere((item) => item.product == product);
    if (index == -1) {
      state = [...state, CartItemModel(product: product)];
    } else {
      state[index].quantity++;
      state = [...state];
    }
  }

  int get totalprice {
    int price = 0;
    for (var item in state) {
      if (item.isSelected) {
        price += item.product.price.toInt() * item.quantity;
      }
    }
    return price;
  }

  void increaseQuantity(int index) {
   state[index].quantity++;
    state = [...state];
  }

  void decreaseQuantity(int index) {
    if (state[index].quantity > 1) {
      state[index].quantity--;
      state = [...state];
    }
  }

  void toggleSelection(int index) {
    state[index].isSelected = !state[index].isSelected;
   state = [...state];
  }

  void removeItem(int index) {
    state.removeAt(index);
    state = [...state];
  }
}
final cartprovider = NotifierProvider<Cartprovider, List<CartItemModel>>(() {
  return Cartprovider();
});
