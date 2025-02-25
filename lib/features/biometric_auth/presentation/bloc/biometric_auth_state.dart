import '../../domain/entities/secure_file.dart';

abstract class BiometricAuthState {}

class BiometricInitial extends BiometricAuthState {}

class BiometricLoading extends BiometricAuthState {}

class BiometricAuthenticated extends BiometricAuthState {
  final SecureFile secureFile;

  BiometricAuthenticated(this.secureFile);
}

class BiometricFailure extends BiometricAuthState {
  final String error;

  BiometricFailure(this.error);
}
