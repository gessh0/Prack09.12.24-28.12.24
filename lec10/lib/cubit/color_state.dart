part of 'color_cubit.dart';

sealed class ColorState extends Equatable{
  final Color color;

  const ColorState(this.color);

  @override  
  List<Object> get props =>[color];
}

final class ColorInitialState extends ColorState{
  const ColorInitialState():super(Colors.deepPurple);
}

final class ColorCurrentState extends ColorState{
  const ColorCurrentState(super.color);
}