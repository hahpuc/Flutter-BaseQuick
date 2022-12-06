import 'package:base_quick/src/data/datasources/local/sqflite/data_sources/province_data_source.dart';
import 'package:base_quick/src/data/repositories/sqflite_repository_impl.dart';
import 'package:base_quick/src/di/local_module.dart';
import 'package:base_quick/src/domain/repositories/sqflite_repository.dart';
import 'package:sqflite/sqflite.dart';

import '/src/domain/usecases/user_usecase/get_user_by_id_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasources/local/pref/pref_helper.dart';
import '../data/datasources/remote/dio_helper.dart';
import '../data/datasources/remote/services/users_api_service.dart';
import '../data/repositories/pref_repository_impl.dart';
import '../data/repositories/users_repository_impl.dart';
import '../domain/repositories/pref_repository.dart';
import '../domain/repositories/users_repository.dart';
import '../domain/usecases/user_usecase/get_user_usecase.dart';

final injector = GetIt.instance;

Future setUpServiceLocator() async {
  // ------------- PrefRespository
  final sharedPreferencse = await LocalModule.provideSharedPreferences();
  injector.registerLazySingleton<PrefRepository>(
    () => PrefRepositoryImpl(PrefHelper(sharedPreferencse)),
  );

  // ------------ SqfliteRepository
//   final sqfliteDB = LocalModule.provideSqflite();
//   injector.registerSingleton<Database>(sqfliteDB);

//   injector.registerLazySingleton<SqfliteRepository>(() => SqfliteRepositoryImpl(
//         ProvinceDataSource(injector.get<Database>()),
//       ));

  // ------------- DIO
  injector.registerLazySingleton<DioHelper>(() => DioHelper());

  // ------------- API Services
  injector.registerLazySingleton<UsersApiService>(
      () => UsersApiService(injector.get()));

  // ------------- Repository
  injector.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImpl(injector.get()));

  // ------------- UseCase
  injector.registerLazySingleton<GetUsersUseCase>(
      () => GetUsersUseCase(injector.get()));

  injector.registerLazySingleton<GetUserByIdUseCase>(
      () => GetUserByIdUseCase(injector.get()));
}
