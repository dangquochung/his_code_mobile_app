import 'package:flutter/material.dart';
import 'package:vnpt_his/features/home/domain/entities/feature.dart';

class NativeFeaturePage extends StatelessWidget {
  final Feature feature;

  const NativeFeaturePage({Key? key, required this.feature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Tùy chỉnh giao diện của bạn theo nhu cầu
    return Scaffold(
      appBar: AppBar(
        title: Text(feature.title),
      ),
      body: Center(
        child: Text("Đây là native feature: ${feature.title}"),
      ),
    );
  }
}
