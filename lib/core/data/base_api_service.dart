import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseApiService {
  final String baseUrl;

  BaseApiService(this.baseUrl);

  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(url, headers: headers);
      _handleErrors(response);
      return response;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<http.Response> post(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      _handleErrors(response);
      return response;
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

  void _handleErrors(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        'Error ${response.statusCode}: ${response.reasonPhrase}',
      );
    }
  }
}