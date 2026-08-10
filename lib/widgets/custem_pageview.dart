import 'package:flutter/material.dart';

class CustemPageview extends StatelessWidget {
  CustemPageview({
    super.key,
    required this.productImages,
    required this.constraints,
    required this.pageController,
    this.onPageChanged_,
  });
  final List<String> productImages;
  final BoxConstraints constraints;
  BorderRadius borderRadius = BorderRadius.circular(20);
  final PageController pageController;
  void Function(int)? onPageChanged_;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged_,
      controller: pageController,
      itemCount: productImages.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.05,
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Image.asset(productImages[index], fit: BoxFit.cover),
          ),
        );
      },
    );
    ;
  }
}
