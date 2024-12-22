import 'package:lec12/core/failure/Failure.dart';

class ColorFailure extends Failure{
  ColorFailure({required super.code,super.message});

  @override
  String getLocalizedString(){
      return 'Ошибка';
  }
}