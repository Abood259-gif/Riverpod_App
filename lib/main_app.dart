import 'package:flutter/material.dart';
import 'package:responsive_app/app_router.dart';
import 'package:responsive_app/screens/product_details.dart';
import 'package:responsive_app/screens/profile_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
    routerConfig: router,
    );
  }
}
