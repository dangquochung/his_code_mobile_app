import 'package:flutter/material.dart';
import '../../domain/entities/feature.dart';

class FeatureModel extends Feature {
  const FeatureModel({
    required String title,
    required String iconUrl,
    required Color iconColor,
    required String bundle,
    required String bundleId,
  }) : super(
          title: title,
          iconUrl: iconUrl,
          iconColor: iconColor,
          bundle: bundle,
          bundleId: bundleId,
        );

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      title: json['title'] as String,
      iconUrl: json['iconUrl'] as String,
      iconColor: Color(int.parse(json['iconColor'].substring(1, 7), radix: 16) + 0xFF000000),
      bundle: json['bundle'] as String,
      bundleId: json['bundleId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'iconUrl': iconUrl,
      'iconColor': '#${iconColor.value.toRadixString(16).substring(2)}',
      'bundle': bundle,
      'bundleId': bundleId,
    };
  }
}