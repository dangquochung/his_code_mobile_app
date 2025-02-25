import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vnpt_his/features/about_us/presentation/views/about_us_view.dart';
import 'package:vnpt_his/features/appointment/presentation/views/appointment_view.dart';
import 'package:vnpt_his/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:vnpt_his/features/notification/presentation/views/notification_view.dart';
import 'package:vnpt_his/features/landing_page/presentation/views/landing_view.dart';
import 'package:vnpt_his/features/login/presentation/views/login_view.dart';
import 'package:vnpt_his/features/navigation/presentation/views/navigation_view.dart';
import 'package:vnpt_his/features/news/presentation/views/news_view.dart';
import 'package:vnpt_his/features/product/presentation/views/product_view.dart';
import 'package:vnpt_his/routes/default_page_transition.dart';

class AppRoutes {
  static const String landing = '/';
  static const String login = '/login';
  static const String product = '/product';
  static const String aboutUs = '/aboutUs';
  static const String news = '/news';
  static const String navigation = '/navigation';
  static const String appointment = '/appointment';
  static const String notification = '/notification';
// Add more routes as needed
}

final goRouter = GoRouter(
  initialLocation: AppRoutes.landing,
  routes: [
    GoRoute(
      path: AppRoutes.landing,
      pageBuilder: (context, state) {
        return buildPageWithTransition(LandingView());
      },
    ),
    GoRoute(
      path: AppRoutes.login,
      pageBuilder: (context, state) {
        return buildPageWithTransition(LoginView());
      },
    ),
    GoRoute(
      path: AppRoutes.product,
      pageBuilder: (context, state) {
        return buildPageWithTransition(ProductView());
      },
    ),
    GoRoute(
      path: AppRoutes.aboutUs,
      pageBuilder: (context, state) {
        return buildPageWithTransition(AboutUsView());
      },
    ),
    GoRoute(
      path: AppRoutes.news,
      pageBuilder: (context, state) {
        return buildPageWithTransition(NewsView());
      },
    ),
    GoRoute(
      path: AppRoutes.navigation,
      pageBuilder: (context, state) {
        return buildPageWithTransition(NavigationView());
      },
    ),
    GoRoute(
      path: AppRoutes.appointment,
      pageBuilder: (context, state) {
        return buildPageWithTransition(AppointmentView());
      },
    ),
    GoRoute(
      path: AppRoutes.notification,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: BlocProvider<NotificationCubit>.value(
            value: state.extra! as NotificationCubit,
            child: NotificationView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      },
    ),
    // Add more routes here
  ],
);