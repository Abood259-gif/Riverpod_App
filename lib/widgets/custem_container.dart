import 'package:flutter/material.dart';

class CustemContainer extends StatelessWidget {
  const CustemContainer({
    super.key,
    required this.constraints,
    required this.colors_,
    required this.text,
    required this.icon,
    required this.price,
    required this.inc,
  });
  final BoxConstraints constraints;
  final List<Color> colors_;
  final String text;
  final Icon icon;
  final double price;
  final double inc;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: constraints.maxWidth * 0.4,
      height: constraints.maxHeight * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: colors_,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon,
            ],
          ),
          Text(
            price.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '+$inc% vs last week',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
