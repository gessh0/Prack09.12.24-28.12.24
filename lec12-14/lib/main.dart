import 'package:flutter/material.dart';
import 'package:lec12/core/di/configure_dependencies.dart';
import 'package:lec12/feature/presentation/page/color_page.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Arch Demo',
      routes: {
        '/': (context) => const CubitPage(),
        '/second': (context) =>const CubitPage(),
      },
    );
  }
}
