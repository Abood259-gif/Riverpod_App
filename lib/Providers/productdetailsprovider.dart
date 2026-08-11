import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app/model/product_model.dart';
import 'package:responsive_app/service/appservice.dart';

final productselectedprovider = FutureProvider.autoDispose
    .family<ProductModel, int>((ref, productid) async {
      ref.keepAlive();
      ref.onDispose(() {
        print(
          ' [LOG] Product $productid provider disposed and memory cleared.',
        );
      });
      final proudct = await Appservice.featch_product_by_id(productid);
      return proudct;
    });