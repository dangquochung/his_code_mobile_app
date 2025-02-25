import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Feature extends Equatable {
  final String title;
  final String iconUrl;
  final Color iconColor;
  final String bundle;
  final String bundleId;
  final bool isMiniApp;
  const Feature({
    required this.title,
    required this.iconUrl,
    required this.iconColor,
    required this.bundle,
    required this.bundleId,
    this.isMiniApp = true, 
  });

  @override
  List<Object> get props => [title, iconUrl, iconColor, bundle, bundleId, isMiniApp];
}