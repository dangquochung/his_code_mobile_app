// lib/injection_container.dart
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Home module
import 'features/home/data/datasources/home_local_datasource.dart';
import 'features/home/data/datasources/home_remote_datasource.dart';
import 'core/network/network_info.dart';

// Biometric Auth module
import 'package:vnpt_his/features/biometric_auth/data/datasources/biometric_service.dart';
import 'package:vnpt_his/features/biometric_auth/data/repositories/biometric_repository_impl.dart';
import 'package:vnpt_his/features/biometric_auth/domain/usecases/authenticate_and_get_pdf.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Use case của Biometric Auth
  sl.registerLazySingleton(() => AuthenticateAndGetPdf(sl<BiometricRepository>()));


  // Repository của Biometric Auth
  sl.registerLazySingleton<BiometricRepository>(
    () => BiometricRepositoryImpl(biometricService: sl()),
  );

  // Data sources của Home
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Service của Biometric Auth
  sl.registerLazySingleton(() => BiometricService());

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}