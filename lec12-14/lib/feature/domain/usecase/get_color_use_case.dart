import 'package:dartz/dartz.dart';
import 'package:lec12/core/use_case/use_case.dart';
import 'package:lec12/feature/domain/entity/color_entity.dart';
import 'package:lec12/feature/domain/entity/color_failure.dart';
import 'package:lec12/feature/domain/repository/color_repository.dart';

class GetColorUseCase implements UseCaseNoParams<ColorEntity>{
  
final ColorRepository colorRepository;

  GetColorUseCase({required this.colorRepository});


  @override
  Future<Either<ColorFailure, ColorEntity>> call() {
    return colorRepository.read();
  }
  
}