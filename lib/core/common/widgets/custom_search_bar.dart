import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final double borderRadius;

  const CustomSearchBar({
    Key? key,
    this.hintText = 'Search...',
    this.controller,
    this.onChanged,
    this.width,
    this.height = 48,
    this.backgroundColor = Colors.white,
    this.iconColor,
    this.textColor,
    this.borderRadius = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(borderRadius - 4),
        ),
        child: Center(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: TextStyle(
              color: textColor ?? Colors.black87,
              fontSize: 14,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 12, right: 8),
                child: Icon(
                  Icons.search,
                  color: Color(0xFF9E9E9E),
                  size: 24,
                ),
              ),
              isDense: true,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 6, 
              ),
            ),
          ),
        ),
      ),
    );
  }
}
