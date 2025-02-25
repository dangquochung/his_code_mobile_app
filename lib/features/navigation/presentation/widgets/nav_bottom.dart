import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vnpt_his/features/navigation/presentation/widgets/nav_item.dart';
import 'package:vnpt_his/gen/assets.gen.dart';

Widget buildBottomNavBar(BuildContext context, int selectedIndex, int homeIndex, int listIndex, int profileIndex) {
  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 100.0,
        sigmaY: 100.0,
      ),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Color.fromRGBO(233, 244, 255, 0.1),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(233, 244, 255, 0.1),
              spreadRadius: 1,
              blurRadius: 30,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildNavItem(context, homeIndex, Assets.images.navigation.icNavHouse.path),
            buildNavItem(context, listIndex, Assets.images.navigation.icNavDanhmuc.path),
            buildNavItem(context, profileIndex, Assets.images.navigation.icNavProfile.path),
          ],
        ),
      ),
    ),
  );
}