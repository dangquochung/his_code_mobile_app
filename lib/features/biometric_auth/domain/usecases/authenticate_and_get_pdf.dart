import 'package:dartz/dartz.dart';
import 'package:vnpt_his/core/error/failures.dart';
import '../entities/secure_file.dart';

abstract class BiometricRepository {
  Future<Either<Failure, SecureFile>> authenticateAndGetPdf();
}

class AuthenticateAndGetPdf {
  final BiometricRepository repository;

  AuthenticateAndGetPdf(this.repository);

  Future<Either<Failure, SecureFile>> call() async {
    return await repository.authenticateAndGetPdf();
  }
}