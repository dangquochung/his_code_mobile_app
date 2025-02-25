import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  final List<Widget> buttons;

  const CustomFooter({
    Key? key,
    required this.buttons,
  })  : assert(buttons.length <= 5, 'CustomFooter supports up to 5 buttons.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: Colors.green,
      child: Row(
        children: buttons
            .map((button) => Expanded(child: button))
            .toList(), // Chia đều chiều rộng giữa các button
      ),
    );
  }
}