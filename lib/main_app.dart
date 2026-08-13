import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_app/app_router.dart';
import 'package:responsive_app/bloc/auth_bloc.dart';
import 'package:responsive_app/screens/product_details.dart';
import 'package:responsive_app/screens/profile_screen.dart';
import 'package:responsive_app/service/authrsevice.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) { 
        return AuthBloc(authRepository: AuthRepository());
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
      routerConfig: router,
      ),
    );
  }
}
