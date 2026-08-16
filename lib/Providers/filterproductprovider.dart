import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app/Providers/proudctprovider.dart';
import 'package:responsive_app/Providers/select_category_notifier.dart';
import 'package:responsive_app/Providers/selected_category_index.dart';
import 'package:responsive_app/model/product_model.dart';

final filterProudctProvider = Provider<List<ProductModel>>((ref)  {
  final categoryindex = ref.watch(selectedCategoryIndexProvider);
  final categoryselected =  ref.watch(selectCategoryProvider).value ?? [];
  final products = ref.watch(productprovider).value ?? [];

if (categoryselected.isEmpty || 
      categoryindex < 0 || 
      categoryindex >= categoryselected.length) {
    return []; 
  }

  return products.where(
    (item) => item.category.name == categoryselected[categoryindex],
  ).toList();
});
