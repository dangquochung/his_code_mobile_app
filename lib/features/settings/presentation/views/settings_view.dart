import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vnpt_his/core/common/app_dimens.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/widgets/base_app_bar.dart';
import 'package:vnpt_his/features/settings/presentation/widgets/content_with_title_widget.dart';
import 'package:vnpt_his/features/settings/presentation/widgets/settings_panel_view.dart';
import 'package:vnpt_his/gen/assets.gen.dart';
import 'package:vnpt_his/routes/app_routes.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: AppLocale.settings.getString(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppDimens.horizontalPadding),
          child: Column(
            children: [
              SizedBox(height: 12),
              SettingsPanelView(),
              SizedBox(height: 24),
              _buildAccountPanelView(context),
              SizedBox(height: 24),
              _buildSystemPanelView(context),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountPanelView(BuildContext context) {
    return ContentWithTitleWidget(
        title: AppLocale.account.getString(context),
        childrenWidget: Column(
          children: [
            ListTile(
              onTap: () {},
              leading: SvgPicture.asset(Assets.images.profile.icProfileUser),
              title: Text(AppLocale.updateProfile.getString(context)),
            ),
            ListTile(
              onTap: () {},
              leading: SvgPicture.asset(Assets.images.profile.icProfileBio),
              title: Text(AppLocale.updateBio.getString(context)),
            ),
            ListTile(
              onTap: () {},
              leading:
                  SvgPicture.asset(Assets.images.profile.icProfilePassword),
              title: Text(AppLocale.changePassword.getString(context)),
            ),
            ListTile(
              onTap: () {},
              leading:
                  SvgPicture.asset(Assets.images.profile.icProfileLanguage),
              title: Text(AppLocale.language.getString(context)),
            ),
            ListTile(
              onTap: () {},
              leading: SvgPicture.asset(Assets.images.profile.icProfilePrivacy),
              title: Text(AppLocale.privacyPolicy.getString(context)),
            ),
          ],
        ));
  }

  Widget _buildSystemPanelView(BuildContext context) {
    return ContentWithTitleWidget(
        title: AppLocale.signOut.getString(context),
        childrenWidget: Column(
          children: [
            ListTile(
              onTap: () => context.go(AppRoutes.login),
              leading: SvgPicture.asset(Assets.images.profile.icProfileSignOut),
              title: Text(AppLocale.signOut.getString(context)),
            ),
          ],
        ));
  }
}
