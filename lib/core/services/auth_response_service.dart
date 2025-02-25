// auth_response.dart
class AuthResponseService {
  final String accessToken;
  final String tokenType;

  AuthResponseService({
    required this.accessToken,
    required this.tokenType,
  });

  factory AuthResponseService.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return AuthResponseService(
      accessToken: data['accessToken'] as String,
      tokenType: data['tokenType'] as String,
    );
  }
}