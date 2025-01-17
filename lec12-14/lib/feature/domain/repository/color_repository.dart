import 'package:dartz/dartz.dart';
import 'package:lec12/feature/domain/entity/color_entity.dart';
import 'package:lec12/feature/domain/entity/color_failure.dart';

abstract class ColorRepository {
  Future<Either<ColorFailure, ColorEntity>> write(ColorEntity color);

  Future<Either<ColorFailure, ColorEntity>> read();
}