import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/widgets/custom_gradient_button.dart';
import 'package:vnpt_his/routes/app_routes.dart';

Widget buildRegisterButton(BuildContext context) {
  return GradientButton(
    title: AppLocale.signUp.getString(context),
    startColor: Color.fromRGBO(0, 99, 203, 1),
    endColor:  Color.fromRGBO(11, 186, 255, 1),
    borderRadius: 8.0,
    fontStyle: FontStyle.italic,
    onPressed: () {
      context.go(AppRoutes.navigation);
    },
  );
}