import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final Color startColor;
  final Color endColor;
  final double borderRadius;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final bool isEnabled;
  final FontStyle fontStyle;
  final FontWeight fontWeight;

  const GradientButton({
    Key? key,
    required this.title,
    required this.startColor,
    required this.endColor,
    required this.borderRadius,
    this.onPressed,
    this.width = double.infinity,
    this.height = 50.0,
    this.textStyle,
    this.isEnabled = true,
    this.fontStyle = FontStyle.normal, // Mặc định là chữ thường
    this.fontWeight = FontWeight.bold, // Mặc định là chữ đậm
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1.0 : 0.5, // Làm mờ nếu disabled
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: isEnabled
              ? LinearGradient(
                  colors: [startColor, endColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null, // Nếu disabled thì không có gradient
          color: isEnabled ? null : Colors.grey, // Background xám khi disabled
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: isEnabled ? onPressed : null, // Vô hiệu hóa khi không được kích hoạt
            child: Center(
              child: Text(
                title,
                style: textStyle ??
                    TextStyle(
                      color: Colors.white,
                      fontWeight: fontWeight, // Cho phép chỉnh độ đậm
                      fontStyle: fontStyle, // Cho phép chỉnh nghiêng
                      fontSize: 16,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}