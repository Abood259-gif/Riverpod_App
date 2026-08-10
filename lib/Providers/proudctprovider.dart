

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app/data/product_data.dart';
import 'package:responsive_app/model/product_model.dart';

class Productprovider extends AsyncNotifier<List<ProductModel>> {
  @override
  FutureOr<List<ProductModel>> build() async {
 return featch_data();
  }
  Future<List<ProductModel>> featch_data() async{
await Future.delayed(const Duration(seconds: 2));
    return ProductData.products;
  }

Future<void> retry() async {
  state = const AsyncValue.loading();
  state = await AsyncValue.guard(() => featch_data());
}

void forceloading() => state = const AsyncValue.loading();
void forceerror() => state =  AsyncValue.error('Error' , StackTrace.current);
Future<void> forcedata() async {
  state = const AsyncValue.loading();
  state = await AsyncValue.guard(() => featch_data());
}
}
final productprovider = AsyncNotifierProvider<Productprovider, List<ProductModel>>(() {
  return Productprovider();
});