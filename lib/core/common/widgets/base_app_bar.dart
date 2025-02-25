import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vnpt_his/core/common/app_colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? textColor;
  final Color? backgroundColor;
  final bool? needBackButton;
  final VoidCallback? onPressBack;

  const BaseAppBar({
    super.key,
    this.title,
    this.textColor,
    this.backgroundColor,
    this.needBackButton,
    this.onPressBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBgColor,
      scrolledUnderElevation: 0,
      leading: needBackButton == true
          ? GestureDetector(
              onTap: () => context.pop(),
              child: Icon(Icons.arrow_back_ios_new_rounded),
            )
          : SizedBox(),
      centerTitle: true,
      title: Text(
        title ?? '',
        style: TextStyle(
          color: textColor ?? Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
