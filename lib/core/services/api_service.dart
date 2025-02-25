// api_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/mini_app.dart';
import 'auth_response_service.dart';
import 'file_service.dart';

class ApiService {
  static const String baseUrl = 'https://hcgw-test.vncare.vn/api';
  static const String oldIconBaseUrl = 'http://10.0.2.2:3000/images/';
  static const String newIconBaseUrl = 'https://storage-emr.vnpt.vn/demo/public/image-miniapp/';
  
  static Future<String> login() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/saas/public/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'username': 'appmobie',
          'password': 'Vnpt@123#',
          'otp': ''
        }),
      );

      if (response.statusCode == 200) {
        final authResponse = AuthResponseService.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return '${authResponse.tokenType} ${authResponse.accessToken}';
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Login error: $e');
    }
  }

  static String _transformIconUrl(String originalUrl) {
    // Extract the icon filename from the original URL
    final filename = originalUrl.split('/').last;
    // Construct new URL with the new base URL
    return '$newIconBaseUrl$filename';
  }

  static Map<String, dynamic> _transformFeatureData(Map<String, dynamic> featureData) {
    if (featureData['iconUrl'] != null) {
      featureData['iconUrl'] = _transformIconUrl(featureData['iconUrl']);
    }
    return featureData;
  }

  static Future<List<MainFeature>> getFeatures(String authToken) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/saas/khac/search?page=0&size=100&filter=cha.ma%20%3D%3D%20%22MOBILE_MINI_APP%22&sort=stt&sort=asc'),
        headers: {
          'Authorization': authToken,
          'Accept': 'application/json',
          'Accept-Language': 'vi',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(utf8.decode(response.bodyBytes));
        final List<dynamic> content = responseData['data']['content'] as List;
        
        // Transform and convert the API response to MainFeature objects
        final features = content.map((item) {
          final Map<String, dynamic> featureData = jsonDecode(item['giaTri']);
          final transformedData = _transformFeatureData(featureData);
          return MainFeature.fromJson(transformedData);
        }).toList();

        // Save transformed data to offline storage
        await FileService.saveJsonToFile(content.map((item) {
          var copy = Map<String, dynamic>.from(item);
          final featureData = jsonDecode(item['giaTri']);
          final transformedData = _transformFeatureData(featureData);
          copy['giaTri'] = jsonEncode(transformedData);
          return copy;
        }).toList());
        
        return features;
      } else {
        throw Exception('Failed to load features: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading features: $e');
      // Try to load from offline storage if API call fails
      final offlineData = await FileService.readJsonFromFile();
      if (offlineData != null) {
        return offlineData.map((json) {
          final Map<String, dynamic> featureData = jsonDecode(json['giaTri']);
          // Transform URLs even when loading from offline storage
          final transformedData = _transformFeatureData(featureData);
          return MainFeature.fromJson(transformedData);
        }).toList();
      }
      throw Exception('No offline data available');
    }
  }
}