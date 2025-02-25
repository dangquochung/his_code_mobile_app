import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Optional: Nếu bạn muốn mã hoá thêm, import package encrypt
// import 'package:encrypt/encrypt.dart' as encrypt;

class CredentialStorage {
  final FlutterSecureStorage _secureStorage;

  CredentialStorage({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  /// Lưu trữ username, password an toàn
  Future<void> saveCredentials(String username, String password) async {
    // Nếu muốn mã hoá thêm, bạn có thể dùng package encrypt trước khi lưu
    // final key = encrypt.Key.fromUtf8('16charactersKey'); // ví dụ
    // final iv = encrypt.IV.fromLength(16);
    // final encrypter = encrypt.Encrypter(encrypt.AES(key));
    // final encryptedUsername = encrypter.encrypt(username, iv: iv).base64;
    // final encryptedPassword = encrypter.encrypt(password, iv: iv).base64;

    await _secureStorage.write(key: 'username', value: username);
    await _secureStorage.write(key: 'password', value: password);
  }

  /// Lấy username, password đã lưu (nếu có)
  Future<Map<String, String>?> getCredentials() async {
    final username = await _secureStorage.read(key: 'username');
    final password = await _secureStorage.read(key: 'password');
    if (username != null && password != null) {
      // Nếu có dùng encrypt thì cần giải mã
      // final decryptedUsername = ...
      // final decryptedPassword = ...
      return {'username': username, 'password': password};
    }
    return null;
  }

  /// Xoá thông tin đăng nhập
  Future<void> clearCredentials() async {
    await _secureStorage.delete(key: 'username');
    await _secureStorage.delete(key: 'password');
  }
}