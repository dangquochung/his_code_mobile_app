import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/features/landing_page/presentation/widgets/blur_button.dart';
import 'package:vnpt_his/gen/assets.gen.dart';
import 'package:vnpt_his/routes/app_routes.dart';
import 'package:vnpt_his/utils/dimens_util.dart';
import '../bloc/landing_bloc.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LandingBloc(),
      child: Scaffold(
        body: Container(
          width: DimensUtil.getScreenWidth(context),
          height: DimensUtil.getScreenHeight(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.landing.imgLandingBg.path),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      Assets.images.icon.appIconTrans.path,
                      width: DimensUtil.getScreenWidth(context) * 0.2,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Column(
                    spacing: 12,
                    children: [
                      BlurButton(
                        title: AppLocale.signIn.getString(context),
                        onPressed: () {
                          context.go(AppRoutes.login);
                        },
                      ),
                      BlurButton(
                        title: AppLocale.product.getString(context),
                        onPressed: () {
                          context.push(AppRoutes.product);
                        },
                      ),
                      BlurButton(
                        title: AppLocale.aboutUs.getString(context),
                        onPressed: () {
                          context.push(AppRoutes.aboutUs);
                        },
                      ),
                      BlurButton(
                        title: AppLocale.news.getString(context),
                        onPressed: () {
                          context.push(AppRoutes.news);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
