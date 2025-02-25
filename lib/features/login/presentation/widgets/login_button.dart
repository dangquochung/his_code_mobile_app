

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/widgets/custom_gradient_button.dart';
import 'package:vnpt_his/features/login/presentation/bloc/login_bloc.dart';

Widget buildLoginButton(BuildContext context, LoginState state) {
  return Column(
    children: [
      if (state.loginError != null)
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            state.loginError!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      GradientButton(
        title: AppLocale.signIn.getString(context),
        startColor: const Color.fromRGBO(0, 99, 203, 1),
        endColor: const Color.fromRGBO(11, 186, 255, 1),
        borderRadius: 8.0,
        height: 50,
        isEnabled: true,
        onPressed: state.username.isNotEmpty && state.password.isNotEmpty
            ? () {
                context.read<LoginBloc>().add(LoginSubmitted(context));
              }
            : null,
      ),
    ],
  );
}