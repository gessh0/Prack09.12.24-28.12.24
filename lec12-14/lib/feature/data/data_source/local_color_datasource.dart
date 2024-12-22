import 'package:dartz/dartz.dart';
import 'package:lec12/feature/domain/entity/color_failure.dart';

abstract class LocalColorDatasource {
  Future<Either<ColorFailure, String>>write(String color);

  Future<Either<ColorFailure,String>> read();
}