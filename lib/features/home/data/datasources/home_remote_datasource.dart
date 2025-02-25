import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/feature_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<FeatureModel>> getFeatures();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;
  static const String baseUrl = 'https://hcgw-test.vncare.vn/api';
  static const String newIconBaseUrl =
      'https://storage-emr.vnpt.vn/demo/public/image-miniapp/';

  HomeRemoteDataSourceImpl({required this.client});

  static String _transformIconUrl(String originalUrl) {
    // Extract the icon filename from the original URL
    final filename = originalUrl.split('/').last;
    // Construct new URL with the new base URL
    return '$newIconBaseUrl$filename';
  }

  static Map<String, dynamic> _transformFeatureData(
      Map<String, dynamic> featureData) {
    if (featureData['iconUrl'] != null) {
      featureData['iconUrl'] = _transformIconUrl(featureData['iconUrl']);
    }
    return featureData;
  }

  Future<String> _getAuthToken() async {
    final response = await client.post(
      Uri.parse('$baseUrl/saas/public/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {'username': 'appmobie', 'password': 'Vnpt@123#', 'otp': ''}),
    );
    // print("check response: ${response.body} statusCode: ${response.statusCode}");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      // print("accessToken: ${data['tokenType']} ${data['accessToken']}");
      return '${data['tokenType']} ${data['accessToken']}';
    }
    throw Exception('Authentication failed');
  }

  @override
  Future<List<FeatureModel>> getFeatures() async {
    final token = await _getAuthToken();
    print("check token: $token");
    final response = await client.get(
      Uri.parse(
          '$baseUrl/saas/khac/search?page=0&size=100&filter=cha.ma%20%3D%3D%20%22MOBILE_MINI_APP%22&sort=stt&sort=asc'),
      headers: {'Authorization': 'Bearer Bearer $token'},
    );
    print(
        "check response: ${response.body} statusCode: ${response.statusCode}");
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final content = decodedResponse['data']['content'] as List;

      return content
        .map((item) {
          final transformedData = _transformFeatureData(jsonDecode(item['giaTri']));
          return FeatureModel.fromJson(transformedData);
        })
        .toList();
    }
    throw Exception('Failed to load features');
  }
}
