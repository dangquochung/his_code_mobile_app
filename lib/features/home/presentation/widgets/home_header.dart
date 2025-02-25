import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:vnpt_his/gen/assets.gen.dart';
import 'package:vnpt_his/routes/app_routes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.doctorName,
    this.avatarUrl,
  }) : super(key: key);

  final String doctorName;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        int notificationCount = 0;
        if (state is NotificationLoaded) {
          notificationCount = state.notifications.length;
        }

        return Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 24,
                backgroundImage: avatarUrl != null
                    ? NetworkImage(avatarUrl!)
                    : const AssetImage('assets/images/home/default_avatar.png')
                        as ImageProvider,
              ),
              const SizedBox(width: 12),

              // Doctor info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocale.helloDoctor.getString(context),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      doctorName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 99, 203, 1),
                      ),
                    ),
                  ],
                ),
              ),

              // Notification bell
              GestureDetector(
                onTap: () {
                  // Get the existing NotificationCubit instance
                  final notificationCubit =
                  context.read<NotificationCubit>();

                  // Load notifications before navigating
                  notificationCubit.loadNotifications();

                  // Navigate to NotificationListView
                  context.push(
                    AppRoutes.notification,
                    extra: notificationCubit,
                  );
                },
                child: Stack(
                  children: [
                    IconButton(
                      icon: Image.asset(Assets.images.home.icNotiBell.path,
                          height: 24),
                      onPressed: null,
                    ),
                    if (notificationCount > 0)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            notificationCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
