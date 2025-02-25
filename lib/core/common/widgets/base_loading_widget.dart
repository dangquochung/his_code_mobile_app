import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vnpt_his/core/common/app_dimens.dart';

class BaseLoadingWidget extends StatelessWidget {
  const BaseLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/anim/anim_loading.json',
        width: AppDimens.loadingSize,
        height: AppDimens.loadingSize,
      ),
    );
  }
}
