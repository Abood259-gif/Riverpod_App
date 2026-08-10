import 'package:flutter/material.dart';

class CustemTextfield extends StatelessWidget {
  const CustemTextfield({
    super.key,
    required this.widthFactor,
    required this.controller,
    this.icon,
    required this.hintText,
  });
  final double widthFactor;
  final TextEditingController controller;
  final Icon? icon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthFactor,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: icon ?? null,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          filled: true,
          fillColor: Color(0xFF1B1D26),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
