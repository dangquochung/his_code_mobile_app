import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/feature.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_datasource.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Feature>>> getFeatures() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFeatures = await remoteDataSource.getFeatures();
        await localDataSource.cacheFeatures(remoteFeatures);
        return Right(remoteFeatures);
      } catch (e) {
        try {
          final localFeatures = await localDataSource.getCachedFeatures();
          return Right(localFeatures);
        } catch (e) {
          return const Left(CacheFailure('No cached data available'));
        }
      }
    } else {
      try {
        final localFeatures = await localDataSource.getCachedFeatures();
        return Right(localFeatures);
      } catch (e) {
        return const Left(CacheFailure('No cached data available'));
      }
    }
  }
}