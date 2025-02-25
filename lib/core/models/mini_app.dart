import 'package:flutter/material.dart';

class MainFeature {
  final String title;
  final String iconUrl;
  final Color iconColor;
  final String bundle;
  final String bundleId;

  MainFeature({
    required this.title,
    required this.iconUrl,
    required this.iconColor,
    required this.bundle,
    required this.bundleId,
  });

  factory MainFeature.fromJson(Map<String, dynamic> json) {
    if (json['bundleId'] == null) {
      throw Exception('bundleID is required but missing in JSON');
    }
    return MainFeature(
      title: json['title'] as String,
      iconUrl: json['iconUrl'] as String,
      iconColor: Color(
          int.parse(json['iconColor'].substring(1, 7), radix: 16) + 0xFF000000),
      bundle: json['bundle'] as String,
      bundleId: json['bundleId'] as String,
    );
  }
}
