import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:encrypt/encrypt.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final String _encryptionKeyName = 'biometric_encryption_key';

  // Lấy danh sách phương thức sinh trắc học hỗ trợ
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      print("Lỗi khi lấy danh sách sinh trắc học: $e");
      return [];
    }
  }

  // Kiểm tra thiết bị hỗ trợ sinh trắc học
  Future<bool> isBiometricAvailable() async {
    try {
      return await _auth.canCheckBiometrics && await _auth.isDeviceSupported();
    } on PlatformException {
      return false;
    }
  }

  // Thực hiện xác thực
  Future<bool> authenticate() async {
    try {
      List<BiometricType> availableBiometrics = await getAvailableBiometrics();
      print("Thiết bị hỗ trợ: $availableBiometrics");

      bool isAuthenticated = await _auth.authenticate(
        localizedReason: 'Xác thực để truy cập dữ liệu nhạy cảm',
        options: const AuthenticationOptions(
          useErrorDialogs: true, // Hiển thị dialog lỗi hệ thống
          stickyAuth: true, // Giữ phiên đăng nhập nếu có thể
        ),
      );

      print("Xác thực ${isAuthenticated ? "thành công" : "thất bại"}");
      return isAuthenticated;
    } on PlatformException catch (e) {
      print("Lỗi xác thực: ${e.message}");
      return false;
    }
  }

  // Lưu trữ dữ liệu đã mã hóa
  Future<void> saveEncryptedData(String key, String data) async {
    final encryptionKey = await _getEncryptionKey();
    final encrypter = Encrypter(AES(Key.fromBase64(encryptionKey)));
    final encrypted = encrypter.encrypt(data);
    await _storage.write(key: key, value: encrypted.base64);
  }

  // Đọc dữ liệu đã mã hóa
  Future<String?> readEncryptedData(String key) async {
    final encryptionKey = await _getEncryptionKey();
    final encryptedData = await _storage.read(key: key);
    if (encryptedData == null) return null;

    final encrypter = Encrypter(AES(Key.fromBase64(encryptionKey)));
    return encrypter.decrypt(Encrypted.fromBase64(encryptedData));
  }

  // Tạo hoặc lấy encryption key từ Secure Storage
  Future<String> _getEncryptionKey() async {
    String? key = await _storage.read(key: _encryptionKeyName);
    if (key == null) {
      final newKey = Key.fromSecureRandom(32).base64;
      await _storage.write(key: _encryptionKeyName, value: newKey);
      key = newKey;
    }
    return key;
  }
}
