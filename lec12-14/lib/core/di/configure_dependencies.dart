import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:lec12/feature/data/data_source/file_local_color_datasource.dart';
import 'package:lec12/feature/data/data_source/local_color_datasource.dart';
import 'package:lec12/feature/data/data_source/shared_pref_local_color_datasources.dart';
import 'package:lec12/feature/data/repository/color_repository_impl.dart';
import 'package:lec12/feature/domain/repository/color_repository.dart';
import 'package:lec12/feature/domain/usecase/get_color_use_case.dart';
import 'package:lec12/feature/domain/usecase/select_color_use_case.dart';
import 'package:lec12/feature/presentation/cubit/color_cubit.dart';

void configureDependencies(){

  if(kIsWasm){
      GetIt.I.registerFactory<LocalColorDatasource>(
        ()=> SharedPrefLocalColorDatasources());
  } else {
    GetIt.I.registerFactory<LocalColorDatasource>(
      ()=> FileLocalColorDatasource());
  }

  GetIt.I.registerFactory<ColorRepository>(
    ()=> ColorRepositoryImpl(localColorDatasource: GetIt.I()));


    GetIt.I.registerFactory(()=>GetColorUseCase(colorRepository: GetIt.I()));

    GetIt.I.registerFactory(()=>SelectColorUseCase(colorRepository: GetIt.I()));

    GetIt.I.registerLazySingleton<ColorCubit>(()=>ColorCubit(GetIt.I(), GetIt.I()));
}
