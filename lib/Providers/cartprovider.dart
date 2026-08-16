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
      state = state.map((item) {
        if (item.product == product) {
          return item.copyWith(quantity: item.quantity + 1);
        }
        return item;
      }).toList();
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
    final updatelist = [...state];
   updatelist[index] =  updatelist[index].copyWith(quantity: updatelist[index].quantity + 1);
    state = updatelist;
  }

  void decreaseQuantity(int index) {
    if (state[index].quantity > 1) {
      final updatelist = [...state];
   updatelist[index] =  updatelist[index].copyWith(quantity: updatelist[index].quantity - 1);
    state = updatelist;
    }
  }

  void toggleSelection(int index) {
    final updatelist = [...state];
   updatelist[index] =  updatelist[index].copyWith(isSelected: !updatelist[index].isSelected);
    state = updatelist;
  }

  void removeItem(int index) {
    state.removeAt(index);
    state = [...state];
  }
}

final cartprovider = NotifierProvider<Cartprovider, List<CartItemModel>>(() {
  return Cartprovider();
});
