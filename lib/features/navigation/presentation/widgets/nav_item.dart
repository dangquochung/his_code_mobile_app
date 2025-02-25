import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpt_his/features/navigation/presentation/bloc/navigation_cubit.dart';

Widget buildNavItem(BuildContext context, int index, String imagePath) {
  final selectedIndex = context.watch<NavigationCubit>().state;
  final isSelected = selectedIndex == index;

  // Xác định text dựa vào index
  String getText(int index) {
    switch (index) {
      case 0:
        return 'Trang chủ';
      case 1:
        return 'Danh mục';
      case 2:
        return 'Hồ sơ';
      default:
        return '';
    }
  }

  return GestureDetector(
    onTap: () => context.read<NavigationCubit>().setSelectedIndex(index),
    child: Container(
      width: 80, // Tăng width để chứa text
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 24,
            height: 24,
            color: isSelected ? const Color(0xFF0066CC) : const Color.fromRGBO(20, 20, 20, 1),
          ),
          const SizedBox(height: 4),
          Text(
            getText(index),
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? const Color(0xFF0066CC) : const Color.fromRGBO(20, 20, 20, 1),
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}