import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  SizeWidget({
    super.key,
    required this.padding,
    required this.text,
    required this.indx,
    required this.current_indx,
  });
  double padding;
  String text;
  int indx;
  int current_indx;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: padding * 0.7,
      ),
      decoration: BoxDecoration(
        color: indx == current_indx
              ? Color(0xFF23C563)
              : const Color(0xFF2C2C36),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:  const Color(0xFF2C2C36), // لون الـ Stroke
          width: 2, // سُمك الـ Stroke بالبكسل
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
