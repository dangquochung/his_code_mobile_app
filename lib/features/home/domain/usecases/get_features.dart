import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/feature.dart';
import '../repositories/home_repository.dart';

class GetFeatures implements UseCase<List<Feature>, NoParams> {
  final HomeRepository repository;

  GetFeatures(this.repository);

  @override
  Future<Either<Failure, List<Feature>>> call(NoParams params) async {
    return await repository.getFeatures();
  }
}