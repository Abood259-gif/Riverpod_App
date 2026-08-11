import 'package:flutter/material.dart';

class CustemPageview extends StatelessWidget {
  final url = 'https://whitescreen.im/images/gray-screen-1920x1080.png' ;
  CustemPageview({
    super.key,
    required this.productImages,
    required this.constraints,
    required this.pageController,
  });
  final List<String>? productImages;
  final BoxConstraints constraints;
  BorderRadius borderRadius = BorderRadius.circular(20);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: productImages?.length ?? 0 , 
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.05,
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child:  Image.network(productImages?[index] ?? url, fit: BoxFit.cover),
          ),
        );
      },
    );
    ;
  }
}
