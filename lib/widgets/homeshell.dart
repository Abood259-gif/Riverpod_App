import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_app/app_router.dart';
import 'package:responsive_app/model/cartitemmodel.dart';
import 'package:responsive_app/model/product_model.dart';
import 'package:responsive_app/state/cart_sate.dart';

class Homeshell extends StatefulWidget {
  const Homeshell({super.key, required this.child});
  final Widget child;

  @override
  State<Homeshell> createState() => HomeshellState();
}

class HomeshellState extends State<Homeshell> {
 

  @override
  Widget build(BuildContext context) {
    final String curLocation = GoRouterState.of(context).uri.path;
    final int curInd = curLocation == AppRouter.profileRoute
        ? 1
        : curLocation == AppRouter.cartRoute
        ? 2
        : 0;

    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: widget.child,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF262626),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFF383838)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: _NavItem(
                  icon: Icons.shopping_bag_outlined,
                  label: 'Products',
                  isSelected: curInd == 0,
                  onTap: () => context.go(AppRouter.productsRoute),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _NavItem(
                  icon: Icons.person_outline,
                  label: 'Profile',
                  isSelected: curInd == 1,
                  onTap: () => context.go(AppRouter.profileRoute),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _NavItem(
                  icon: Icons.shopping_cart,
                  label: 'Cart',
                  isSelected: curInd == 2,
                  onTap: () => context.go(AppRouter.cartRoute),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color foreground = isSelected
        ? Colors.white
        : const Color(0xFF9A9A9A);

    return Material(
      color: isSelected ? const Color(0xFF328A5B) : Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF328A5B) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: foreground, size: 24),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: foreground,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
