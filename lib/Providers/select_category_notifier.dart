

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app/model/categorymodel.dart';
import 'package:responsive_app/service/appservice.dart';
import 'package:responsive_app/service/category_data.dart';

class SelectCategoryNotifier extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    return featchCategory();
  }

Future<List<String>> featchCategory() async {
  await Future.delayed(const Duration(seconds: 2));
  return Appservice.featch_all_categories();
}


}
final selectCategoryProvider = AsyncNotifierProvider<SelectCategoryNotifier, List<String>>(() {
  return SelectCategoryNotifier();
});