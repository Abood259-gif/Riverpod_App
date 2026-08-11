import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_app/Providers/filterproductprovider.dart';
import 'package:responsive_app/Providers/proudctprovider.dart';
import 'package:responsive_app/Providers/cartprovider.dart';
import 'package:responsive_app/Providers/select_category_notifier.dart';
import 'package:responsive_app/Providers/selected_category_index.dart';
import 'package:responsive_app/model/product_model.dart';
import 'package:responsive_app/widgets/product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<List<ProductModel>>>(productprovider, (
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
    final filterdProducts = ref.watch(filterProudctProvider);
    final Category = ref.watch(selectCategoryProvider);
    final prductasyncValue = ref.watch(productprovider);
    final cartproviderr = ref.watch(cartprovider.notifier);
    final int _selectedCategoryIndex = ref.watch(selectedCategoryIndexProvider);
    final categoryes = Category.value;
    print('Building ProductsScreen');
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isNarrow = constraints.maxWidth <= 430;
            final int columns = isNarrow ? 2 : 3;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isNarrow ? 12 : 24,
                vertical: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(
                      color: Color(0xFF818181),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'All Products',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w800,
                            height: 1.05,
                          ),
                        ),
                      ),
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D2D2D),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      hintStyle: const TextStyle(color: Color(0xFF8B8B8B)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF8B8B8B),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF2D2D2D),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF3B3B3B)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF5A5A5A)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    child: Category.when(
                      data: (categorys) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final bool isSelected =
                                index == _selectedCategoryIndex;
                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(
                                      selectedCategoryIndexProvider.notifier,
                                    )
                                    .setSelectedCategoryIndex(index);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 22,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFF4565C6)
                                      : const Color(0xFF2F2F2F),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Center(
                                  child: Text(
                                    categorys[index],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : const Color(0xFFA3A3A3),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                          itemCount: categorys.length,
                        );
                      },
                      loading: () => Skeletonizer(
                        child: SizedBox(
                          height: 48,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2F2F2F),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                            itemCount: 5,
                          ),
                        ),
                      ),
                      error: (error, stackTrace) => Center(
                        child: Text(
                          'Error loading categories: $error',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: prductasyncValue.when(
                      data: (productlist) {
                        return GridView.builder(
                          itemCount: filterdProducts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: columns,
                                crossAxisSpacing: isNarrow ? 10 : 12,
                                mainAxisSpacing: isNarrow ? 10 : 12,
                                childAspectRatio: isNarrow ? 0.64 : 0.68,
                              ),
                          itemBuilder: (context, index) {
                            final ProductModel product = filterdProducts[index];
                            return ProductCard(
                              onAddToCart: () {
                                print(
                                  'Adding product to cart: ${product.name}',
                                );
                                cartproviderr.addProduct(product);
                              },
                              onTap: () {
                                print('Tapped on product: ${product.name}');
                                context.push('/details/${product.id}');
                              },
                              product: product,
                            );
                          },
                        );
                      },
                      loading: () => Skeletonizer(
                        enabled: true, // تفعيل تأثير الـ Skeleton
                        child: GridView.builder(
                          itemCount:
                              6, // عدد العناصر الوهمية التي تريد عرضها أثناء التحميل
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: columns,
                                crossAxisSpacing: isNarrow ? 10 : 12,
                                mainAxisSpacing: isNarrow ? 10 : 12,
                                childAspectRatio: isNarrow ? 0.64 : 0.68,
                              ),
                          itemBuilder: (context, index) {
                            // نمرر نفس كارت المنتج المعتاد، لكن ببيانات وهمية (Dummy Data)
                            return ProductCard(
                              onAddToCart: () {},
                              onTap: () {},
                              product: ProductModel(
                                id: 1,
                                name:
                                    'اسم منتج وهمي للعرض فقط', // طول النص يحدد طول شريط الـ Skeleton
                                description: 'وصف وهمي',
                                price: 99.99,
                                image: [
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYkMEI2jPwLYDriC7k3_GPAr9-rOcYgYoz1uatrO3jKA&s',
                                ],
                                slug: 'slug',
                                categoryName: 'فئة وهمية',
                              ),
                            );
                          },
                        ),
                      ),
                      error: (error, stackTrace) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Failed to load products.',
                              style: TextStyle(
                                
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                ref.read(productprovider.notifier).retry();
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
