import 'dart:convert';

import '../models/mini_app.dart';
import 'api_service.dart';
import 'file_service.dart';

Future<List<MainFeature>> loadFeaturesFromApi() async {
  try {
    // First, get the auth token
    final authToken = await ApiService.login();
    
    // Then, get the features using the auth token
    return await ApiService.getFeatures(authToken);
  } catch (e) {
    print('Error in loadFeaturesFromApi: $e');
    
    // Try to load from offline storage as fallback
    final offlineData = await FileService.readJsonFromFile();
    if (offlineData != null) {
      return offlineData.map((json) {
        final Map<String, dynamic> featureData = jsonDecode(json['giaTri']);
        return MainFeature.fromJson(featureData);
      }).toList();
    }
    throw Exception('Failed to load features and no offline data available');
  }
}