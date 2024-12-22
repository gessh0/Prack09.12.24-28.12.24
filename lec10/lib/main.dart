import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lec10/bloc/color_bloc.dart';
// import 'package:lec10/block_page.dart';
import 'package:lec10/cubit_page.dart';

final colorBloc=ColorBloc();

void main() {
  runApp(MaterialApp(
    routes: {
      '/':(context) =>const CubitPage(),
      '/second':(context) => const CubitPage(),
    },
  ));
}
