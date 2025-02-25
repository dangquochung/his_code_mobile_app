import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:vnpt_his/core/common/app_dimens.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/widgets/app_constants.dart';
import 'package:vnpt_his/features/about_us/presentation/widgets/blur_container_widget.dart';
import 'package:vnpt_his/features/about_us/presentation/widgets/customer_service_dialog.dart';
import 'package:vnpt_his/gen/assets.gen.dart';
import 'package:vnpt_his/utils/dimens_util.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Text(
            AppLocale.aboutUs.getString(context),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ), // Set title color to white
          ),
          centerTitle: true, // Center the title
        ),
        body: Container(
          width: DimensUtil.getScreenWidth(context),
          height: DimensUtil.getScreenHeight(context),
          padding:
              EdgeInsets.symmetric(horizontal: AppDimens.horizontalPadding),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.landing.imgLandingBg.path),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 64,
            children: [
              BlurContainerWidget(
                iconPath: Assets.images.landing.icPhone,
                title: AppLocale.aboutUsContact.getString(context),
                description: '',
                buttonText: AppConstants.aboutUsPhoneNum,
                onPressed: () {},
              ),
              BlurContainerWidget(
                iconPath: Assets.images.landing.icCskh,
                title: AppLocale.aboutUsCskh.getString(context),
                description: AppLocale.aboutUsCskhDes.getString(context),
                buttonText: AppLocale.sendInfo.getString(context),
                onPressed: () => _showMyDialog(context),
              ),
              SizedBox()
            ],
          ),
        ));
  }

  void _showMyDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const CustomerServiceDialog();
      },
    );
  }
}
