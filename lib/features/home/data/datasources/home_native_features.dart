import 'package:flutter/material.dart';
import 'package:vnpt_his/features/home/domain/entities/feature.dart';
import 'package:vnpt_his/gen/assets.gen.dart';

final List<Feature> nativeFeatures = [
  Feature(
    title: 'Biometric',
    bundle: '', // Không cần URL vì là native
    iconUrl: Assets.images.home.icThongke,
    bundleId: 'native1',
    isMiniApp: false,
    iconColor: Colors.blue,
  ),
  Feature(
    title: 'Native Feature 2',
    bundle: '',
    iconUrl: Assets.images.home.icThongke,
    bundleId: 'native2',
    isMiniApp: false,
    iconColor: Colors.blue,
  ),
];
