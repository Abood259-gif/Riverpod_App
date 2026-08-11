import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:responsive_app/main_app.dart';
import 'package:responsive_app/state/cart_sate.dart';

void main() {
  runApp(ProviderScope(
    child: const MainApp(),
  ));
}

