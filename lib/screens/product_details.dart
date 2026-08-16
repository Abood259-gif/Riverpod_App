import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_app/Providers/cartprovider.dart';
import 'package:responsive_app/Providers/productdetailsprovider.dart';
import 'package:responsive_app/service/product_data.dart';
import 'package:responsive_app/model/product_model.dart';
import 'package:responsive_app/widgets/custem_pageview.dart';
import 'package:responsive_app/widgets/size_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsPage extends ConsumerWidget {
  final int productid;
  ProductDetailsPage({super.key, required this.productid});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<ProductModel>>(productselectedprovider(productid), (
      previous,
      next,
    ) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${next.error}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
    final cartproviderr = ref.read(cartprovider.notifier);
    final product = ref.watch(productselectedprovider(productid));
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 18, 25),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF0F1015),
        leading: IconButton(
          onPressed: () {
            context.pop(); // أو Navigator.pop(context)
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: SafeArea(
              child: product.when(
                data: (productt) => Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * 0.4,
                          child: CustemPageview(
                            pageController: _pageController,
                            productImages: productt.images,
                            constraints: constraints,
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: productt.images.length,
                          effect: WormEffect(
                            dotColor: const Color.fromARGB(255, 135, 135, 135),
                            activeDotColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.all(constraints.maxHeight * 0.02),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              productt.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              constraints.maxHeight * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF152B20),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  ' \$${productt.price}',
                                  style: const TextStyle(
                                    color: Color(0xFF1DE872),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.all(constraints.maxHeight * 0.02),
                      child: Text(
                        productt.description,
                        style: const TextStyle(
                          color: Color(0xFF9E9EA8),
                          fontSize: 20,
                        ),
                      ),
                    ),

                    SizedBox(height: constraints.maxHeight * 0.02),

                    SizedBox(height: constraints.maxHeight * 0.02),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    Divider(
                      color: const Color.fromARGB(255, 59, 59, 59),
                      thickness: 1,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    ElevatedButton(
                      onPressed: () {
                       cartproviderr.addProduct(productt);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${productt.name} added to cart!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF23C563),
                        padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.3,
                          vertical: constraints.maxHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: SizedBox(
                        width: constraints.maxWidth * 0.3,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: constraints.maxHeight * 0.03,
                              ),

                              const Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                loading: () => Skeletonizer(
                  child: Column(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.4,
                        child: CustemPageview(
                          pageController: _pageController,
                          productImages: null,
                          constraints: constraints,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 1,
                        effect: WormEffect(
                          dotColor: const Color.fromARGB(255, 135, 135, 135),
                          activeDotColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                error: (error, stackTrace) =>
                    Center(child: Text('Error: $error')),
              ),
            ),
          );
        },
      ),
    );
  }
}
