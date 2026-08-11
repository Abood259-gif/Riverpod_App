import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app/Providers/cartprovider.dart';
import 'package:responsive_app/widgets/cartitem.dart';

class CartscreenScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartproviderr = ref.read(cartprovider.notifier);
    final cartItems = ref.watch(cartprovider);
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
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return CartItemTile(
                          isSelected: item.isSelected,
                          title: item.product.name,
                          price:
                              '\$${item.product.price.toStringAsFixed(2)}',
                          quantity: item.quantity,
                          onIncrement: () =>
                              cartproviderr.increaseQuantity(index),
                          onDecrement: () =>
                              cartproviderr.decreaseQuantity(index),
                          onSelectedChanged: (bool? value) {
                            cartproviderr.toggleSelection(index);
                          },
                          image:item
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
