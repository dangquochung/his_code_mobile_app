import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor; // Màu khi được chọn
  final Color unselectedColor; // Màu khi không được chọn

  const CustomTab({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
    required this.unselectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? unselectedColor : selectedColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}