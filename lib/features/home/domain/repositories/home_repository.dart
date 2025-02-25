import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/feature.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Feature>>> getFeatures();
}