
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_app/app_router.dart';
import 'package:responsive_app/bloc/auth_bloc.dart';
import 'package:responsive_app/bloc/auth_events.dart';
import 'package:responsive_app/bloc/auth_state.dart';
import 'package:responsive_app/widgets/login_card.dart';
import 'package:responsive_app/widgets/login_header.dart';
import 'package:responsive_app/widgets/login_primary_button.dart';
import 'package:responsive_app/widgets/login_section_divider.dart';
import 'package:responsive_app/widgets/login_social_button.dart';
import 'package:responsive_app/widgets/login_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _avatarController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _avatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isCompact = constraints.maxWidth < 460;
          final bool isVeryNarrow = constraints.maxWidth < 360;
          final double maxCardWidth = constraints.maxWidth > 900 ? 600 : 540;

          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isCompact ? 14 : 24,
                  vertical: 20,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxCardWidth),
                  child: LoginCard(
                    padding: EdgeInsets.all(isCompact ? 20 : 32),
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else if (state is AuthAuthenticated) {
                          context.go(AppRouter.profileRoute);
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            LoginHeader(
                              title: 'Create account',
                              subtitle: 'Sign up to get started',
                              icon: Icons.person_add_outlined,
                              boxSize: isCompact ? 84 : 96,
                              iconSize: isCompact ? 38 : 44,
                              titleFontSize: isCompact ? 38 : 52,
                              subtitleFontSize: isCompact ? 16 : 18,
                            ),
                            SizedBox(height: isCompact ? 24 : 30),
                            LoginTextField(
                              label: 'Full Name',
                              hintText: 'Nicolas',
                              controller: _nameController,
                            ),
                            const SizedBox(height: 18),
                            LoginTextField(
                              label: 'Email address',
                              hintText: 'you@example.com',
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                            ),
                            const SizedBox(height: 18),
                            LoginTextField(
                              label: 'Password',
                              hintText: '••••••••',
                              controller: _passwordController,
                              isPassword: true,
                            ),
                            const SizedBox(height: 18),
                            LoginTextField(
                              label: 'Avatar URL (Optional)',
                              hintText: 'https://picsum.photos/800',
                              controller: _avatarController,
                            ),
                            const SizedBox(height: 28),
                            if (state is AuthLoading)
                              const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFF2F66E4),
                                ),
                              )
                            else
                              LoginPrimaryButton(
                                text: 'Sign up',
                                onPressed: () {
                                  final name = _nameController.text.trim();
                                  final email = _emailController.text.trim();
                                  final password = _passwordController.text.trim();
                                  final avatar = _avatarController.text.trim();

                                  if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
                                    context.read<AuthBloc>().add(
                                          SignUpSubmitted(
                                            name: name,
                                            email: email,
                                            password: password,
                                            avatar: avatar.isEmpty ? null : avatar,
                                          ),
                                        );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please fill in all required fields'),
                                      ),
                                    );
                                  }
                                },
                              ),
                            const SizedBox(height: 28),
                            const LoginSectionDivider(text: 'or continue with'),
                            const SizedBox(height: 24),
                            if (isVeryNarrow) ...[
                              LoginSocialButton(
                                label: 'Google',
                                leading: const Text(
                                  'G',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(height: 12),
                              LoginSocialButton(
                                label: 'Apple',
                                leading: const Icon(Icons.apple, size: 26),
                                onPressed: () {},
                              ),
                            ] else ...[
                              Row(
                                children: [
                                  Expanded(
                                    child: LoginSocialButton(
                                      label: 'Google',
                                      leading: const Text(
                                        'G',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: LoginSocialButton(
                                      label: 'Apple',
                                      leading: const Icon(Icons.apple, size: 24),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            const SizedBox(height: 30),
                            Center(
                              child: GestureDetector(
                                onTap: () => context.go(AppRouter.loginRoute),
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Already have an account? ',
                                    style: const TextStyle(
                                      color: Color(0xFFA0A0A0),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: 'Sign in',
                                        style: TextStyle(
                                          color: Color(0xFF2F66E4),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}