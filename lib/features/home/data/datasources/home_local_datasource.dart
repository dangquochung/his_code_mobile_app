import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/feature_model.dart';

abstract class HomeLocalDataSource {
  Future<List<FeatureModel>> getCachedFeatures();
  Future<void> cacheFeatures(List<FeatureModel> features);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String cachedFeaturesKey = 'CACHED_FEATURES';

  HomeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<FeatureModel>> getCachedFeatures() {
    final jsonString = sharedPreferences.getStringList(cachedFeaturesKey);
    if (jsonString != null) {
      return Future.value(jsonString
          .map((item) => FeatureModel.fromJson(json.decode(item)))
          .toList());
    }
    throw Exception('No cached data found');
  }

  @override
  Future<void> cacheFeatures(List<FeatureModel> features) {
    final List<String> jsonFeatures =
        features.map((feature) => json.encode(feature.toJson())).toList();
    return sharedPreferences.setStringList(cachedFeaturesKey, jsonFeatures);
  }
}
