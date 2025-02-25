import 'package:flutter/material.dart';
import 'dart:ui';

class BlurButton extends StatelessWidget {
  final String title;
  final double radius;
  final Color? textColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const BlurButton({
    super.key,
    required this.title,
    this.radius = 8.0,
    this.textColor,
    this.borderColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(
                      color:
                          borderColor ?? Theme.of(context).colorScheme.primary,
                      width: 1.5)),
              child: Center(
                  child: Text(title,
                      style: TextStyle(
                        color:
                            textColor ?? Theme.of(context).colorScheme.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ))),
            ),
          ),
        ),
      ),
    );
  }
}
