import 'package:flutter/material.dart';
import 'package:responsive_app/model/cartitemmodel.dart';
import 'package:responsive_app/model/product_model.dart';
import 'package:responsive_app/widgets/homeshell.dart';

class CartSate extends InheritedWidget {
  CartSate({super.key, required super.child , 
  required this.state,
  });

  final HomeshellState state;

  static CartSate? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartSate>();
  }

  @override
  bool updateShouldNotify(CartSate oldWidget) {
    return true;
  }
}

class CartProvider with ChangeNotifier{
  int price = 0;
  List<CartItemModel> cartItems = [];
  void addProduct(ProductModel product) {
      final index = cartItems.indexWhere((item) => item.product == product);
      if (index == -1) {
        cartItems.add(CartItemModel(product: product));
      } else {
        cartItems[index].quantity++;
      }
   notifyListeners();
  }

  int get totalprice {
    price = 0;
    for (var item in cartItems) {
      if (item.isSelected) {
        price += item.product.price.toInt() * item.quantity;
      }
    }
    return price;
  }

void increaseQuantity(int index) {
   
      cartItems[index].quantity++;
   notifyListeners();
  }

  void decreaseQuantity(int index) {
   
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
  notifyListeners();
  }

  void toggleSelection(int index) {
    
      cartItems[index].isSelected = !cartItems[index].isSelected;
  notifyListeners();
  }

  void removeItem(int index) {
      cartItems.removeAt(index);
 notifyListeners();
  }
}
