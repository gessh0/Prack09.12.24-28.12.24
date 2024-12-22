import 'package:flutter/material.dart';
import 'package:lec9/app_data.dart';

class AppDataProvider extends InheritedWidget{
  const AppDataProvider({required this.appData, required super.child,super.key});

  final AppData appData;

  static AppDataProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDataProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}