import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lec10/util.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState>{
  ColorCubit(): super(const ColorInitialState());

  void newColor(Color color){
    emit(ColorCurrentState(color));
  }

  void newRandomColor(){
    emit(ColorCurrentState(Util.randomColor()));
  }
  void resetColor(){
    emit(const ColorInitialState());
  }
}