import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:vnpt_his/features/settings/presentation/widgets/content_with_title_widget.dart';

class SettingsPanelView extends StatelessWidget {
  const SettingsPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentWithTitleWidget(
      title: AppLocale.settings.getString(context),
      childrenWidget: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildSwitchListTile(
                context: context,
                title: AppLocale.availabilityStatus.getString(context),
                value: state.availabilityEnabled,
                onChanged: (bool value) {
                  context.read<SettingsBloc>().add(ToggleAvailabilityStatus());
                },
              ),
              _buildSwitchListTile(
                context: context,
                title: AppLocale.notification.getString(context),
                value: state.notificationEnabled,
                onChanged: (bool value) {
                  context.read<SettingsBloc>().add(ToggleNotification());
                },
              ),
              _buildSwitchListTile(
                context: context,
                title: AppLocale.darkMode.getString(context),
                value: state.darkModeEnabled,
                onChanged: (bool value) {
                  context.read<SettingsBloc>().add(ToggleDarktMode());
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSwitchListTile({
    required BuildContext context,
    required String title,
    required bool value,
    required Function onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (bool newValue) {
        onChanged(newValue);
      },
    );
  }
}
