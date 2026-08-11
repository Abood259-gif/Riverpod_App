
import 'package:flutter/material.dart';

class CartItemTile extends StatelessWidget {
  final String title;
  final String price;
  final int quantity;
  final bool isSelected;
  final ValueChanged<bool?>? onSelectedChanged;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
final String image;
  const CartItemTile({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    this.isSelected = false,
    this.onSelectedChanged,
    required this.onIncrement,
    required this.onDecrement,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          // 1. Custom Yellow/Orange Checkbox
          Transform.scale(
            scale: 1.1,
            child: Checkbox(
              value: isSelected,
              onChanged: onSelectedChanged,
              activeColor: const Color(0xFFD4E157), // Accent yellow/green color
              checkColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              side: const BorderSide(color: Colors.white38, width: 1.5),
            ),
          ),
          const SizedBox(width: 8),

          // 2. Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              image , 
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 64,
                height: 64,
                color: Colors.white10,
                child: const Icon(Icons.image_not_supported, color: Colors.white38),
              ),
            ),
          ),
          const SizedBox(width: 14),

          // 3. Title & Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 4. Quantity Stepper (- 1 +)
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                _QuantityButton(
                  icon: Icons.remove,
                  onTap: onDecrement,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '$quantity',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _QuantityButton(
                  icon: Icons.add,
                  onTap: onIncrement,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 16,
          color: Colors.white54,
        ),
      ),
    );
  }
}