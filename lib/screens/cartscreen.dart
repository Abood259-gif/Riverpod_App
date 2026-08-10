import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:responsive_app/Providers/cartprovider.dart';
import 'package:responsive_app/model/product_model.dart';
import 'package:responsive_app/state/cart_sate.dart';
import 'package:responsive_app/widgets/cartitem.dart';
import 'package:responsive_app/widgets/homeshell.dart';

class CartscreenScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartproviderr = ref.watch(cartprovider.notifier);
    print('Building CartScreen');
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      appBar: AppBar(
        backgroundColor: const Color(0xFF212121),
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF262626),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView.builder(
                      shrinkWrap:
                          true, // Allows the container height to grow with item count
                      physics:
                          const NeverScrollableScrollPhysics(), // Disables inner scrolling
                      itemCount: ref.watch(cartprovider).length,
                      itemBuilder: (context, index) {
                        return CartItemTile(
                          isSelected: ref.watch(cartprovider)[index].isSelected,
                          title: ref.watch(cartprovider)[index].product.name,
                          price:
                              '\$${ref.watch(cartprovider)[index].product.price.toStringAsFixed(2)}',
                          quantity: ref.watch(cartprovider)[index].quantity,
                          onIncrement: () =>
                              cartproviderr.increaseQuantity(index),
                          onDecrement: () =>
                              cartproviderr.decreaseQuantity(index),
                          onSelectedChanged: (bool? value) {
                            cartproviderr.toggleSelection(index);
                          },
                          image: ref
                              .watch(cartprovider)[index]
                              .product
                              .image[0], // Assuming the first image is used
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              '\$${cartproviderr.totalprice.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
