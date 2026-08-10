

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app/data/category_data.dart';

class SelectCategoryNotifier extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    return featchCategory();
  }

Future<List<String>> featchCategory() async {
  await Future.delayed(const Duration(seconds: 2));
  return CategoryData.categories;
}


}
final selectCategoryProvider = AsyncNotifierProvider<SelectCategoryNotifier, List<String>>(() {
  return SelectCategoryNotifier();
});