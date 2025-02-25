import 'package:bloc/bloc.dart';
import 'biometric_auth_event.dart';
import 'biometric_auth_state.dart';
import '../../domain/usecases/authenticate_and_get_pdf.dart';

class BiometricAuthBloc extends Bloc<BiometricAuthEvent, BiometricAuthState> {
  final AuthenticateAndGetPdf authenticateAndGetPdf;

  BiometricAuthBloc({required this.authenticateAndGetPdf})
      : super(BiometricInitial()) {
    on<AuthenticateEvent>((event, emit) async {
      emit(BiometricLoading());
      final result = await authenticateAndGetPdf();
      result.fold(
        (failure) {
          print("[Bloc] Xác thực thất bại: ${failure.message}");
          emit(BiometricFailure(failure.message));
        },
        (secureFile) {
          print("[Bloc] Xác thực thành công: ${secureFile.fileName}");
          emit(BiometricAuthenticated(secureFile));
        },
      );
    });
  }
}
