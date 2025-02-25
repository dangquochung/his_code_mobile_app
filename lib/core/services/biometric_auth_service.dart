import 'package:local_auth/local_auth.dart';

class BiometricAuthHelper {
  final LocalAuthentication _localAuth;

  BiometricAuthHelper({LocalAuthentication? localAuth})
      : _localAuth = localAuth ?? LocalAuthentication();

  /// Kiểm tra thiết bị có hỗ trợ sinh trắc học không
  Future<bool> canCheckBiometrics() async {
    return await _localAuth.canCheckBiometrics;
  }

  /// Lấy danh sách kiểu sinh trắc học khả dụng
  Future<List<BiometricType>> getAvailableBiometrics() async {
    return await _localAuth.getAvailableBiometrics();
  }

  /// Xác thực bằng sinh trắc học (tự chọn FaceID / TouchID / Fingerprint tuỳ thiết bị)
  Future<bool> authenticate() async {
    try {
      return await _localAuth.authenticate(
        localizedReason: 'Vui lòng xác thực để đăng nhập',
        options: const AuthenticationOptions(
          useErrorDialogs: true, // Hiển thị dialog lỗi hệ thống
          stickyAuth: true, // Giữ phiên đăng nhập nếu có thể
        ),
      );
    } catch (e) {
      return false;
    }
  }
}