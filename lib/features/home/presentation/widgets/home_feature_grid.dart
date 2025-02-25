import 'package:flutter/material.dart';
import 'package:vnpt_his/features/home/domain/entities/feature.dart';
import 'package:vnpt_his/features/home/presentation/bloc/home_state.dart';
import 'package:vnpt_his/features/home/presentation/widgets/home_features.dart';

Widget buildFeaturesGrid(BuildContext context, HomeState state) {
  if (state is HomeLoaded) {
    final features = state.features;
    if (features.isEmpty) return const SizedBox.shrink();

    final int firstRowCount = (features.length / 2).ceil();
    final firstRow = features.sublist(0, firstRowCount);
    final secondRow = features.sublist(firstRowCount);

    return Column(
      children: [
        _buildFeatureRow(firstRow),
        if (secondRow.isNotEmpty) const SizedBox(height: 12),
        if (secondRow.isNotEmpty) _buildFeatureRow(secondRow),
      ],
    );
  }
  return const SizedBox.shrink();
}

Widget _buildFeatureRow(List<Feature> features) {
  return SizedBox(
    height: 110, 
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: features.length,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: FeatureItem(feature: features[index]),
        );
      },
    ),
  );
}