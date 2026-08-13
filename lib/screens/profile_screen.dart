import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_app/bloc/auth_bloc.dart';
import 'package:responsive_app/bloc/auth_state.dart';
import 'package:responsive_app/widgets/profile_option_tile.dart';
import 'package:responsive_app/widgets/profile_stat_chip.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc , AuthState>(
      builder: (BuildContext context, state) {
        final user = state is AuthAuthenticated ? state.user : null;
        return Scaffold(
          backgroundColor: const Color(0xFF212121),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bool isNarrow = constraints.maxWidth < 390;
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isNarrow ? 14 : 20,
                    vertical: 14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Account',
                        style: TextStyle(
                          color: Color(0xFF818181),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'My Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                height: 1.05,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2D2D2D),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.edit_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFF3A3A3A)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: isNarrow ? 62 : 70,
                              width: isNarrow ? 62 : 70,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF4565C6),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'JD',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user?.name ?? 'Jamie Doe',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                   Text(
                                    user?.email ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xFFA0A0A0),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: const [
                          Expanded(
                            child: ProfileStatChip(
                              label: 'Orders',
                              value: '24',
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ProfileStatChip(
                              label: 'Wishlist',
                              value: '12',
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ProfileStatChip(
                              label: 'Reviews',
                              value: '8',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const ProfileOptionTile(
                        icon: Icons.receipt_long_outlined,
                        title: 'Order History',
                        subtitle: 'Track and manage your orders',
                      ),
                      const SizedBox(height: 10),
                      const ProfileOptionTile(
                        icon: Icons.location_on_outlined,
                        title: 'Shipping Address',
                        subtitle: 'Manage saved addresses',
                      ),
                      const SizedBox(height: 10),
                      const ProfileOptionTile(
                        icon: Icons.payment_outlined,
                        title: 'Payment Methods',
                        subtitle: 'Cards and billing options',
                      ),
                      const SizedBox(height: 10),
                      const ProfileOptionTile(
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                        subtitle: 'Notifications and preferences',
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4565C6),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
