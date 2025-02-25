import 'package:flutter/material.dart';

class BaseGradientCard extends StatelessWidget {
  final Widget childWidget;

  const BaseGradientCard({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: childWidget,
    );
  }
}
