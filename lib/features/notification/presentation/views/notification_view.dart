import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/widgets/base_app_bar.dart';
import 'package:vnpt_his/core/common/widgets/base_loading_widget.dart';
import 'package:vnpt_his/features/notification/presentation/bloc/notification_bloc.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: AppLocale.notification.getString(context),
          needBackButton: true,
        ),
        body: NotificationBody());
  }
}

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading) {
          return BaseLoadingWidget();
        } else if (state is NotificationLoaded) {
          final notifications = state.notifications;

          if (notifications.isEmpty) {
            return Center(
              child: Text(AppLocale.notification.getString(context)),
            );
          }

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.notifications),
                title: Text(notifications[index]),
                onTap: () {
                  // Handle notification tap
                },
              );
            },
          );
        } else if (state is NotificationError) {
          return Center(
            child: Text(
              'Lỗi: ${state.message}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        return const SizedBox.shrink(); // Trường hợp không xác định
      },
    );
  }
}
