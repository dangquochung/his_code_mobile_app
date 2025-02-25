import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/features/home/presentation/bloc/home_state.dart';
import 'package:vnpt_his/routes/app_routes.dart';

Widget buildAppointmentSection(
    BuildContext context, int appointmentCount, HomeState state) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: AppLocale.todayAppointment.getString(context),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
              children: [
                TextSpan(
                  text: "($appointmentCount)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Đảm bảo nút "Xem tất cả" co giãn hợp lý
        GestureDetector(
          onTap: () => context.push(AppRoutes.appointment),
          child: Text(
            AppLocale.seeAll.getString(context),
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    ),
  );
}
