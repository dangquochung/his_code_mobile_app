import 'package:flutter/material.dart';

class TwoColumnWidget extends StatelessWidget {
  final List<Widget> leftColumn;
  final List<Widget> rightColumn;

  const TwoColumnWidget({
    Key? key,
    required this.leftColumn,
    required this.rightColumn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Column
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: leftColumn,
            ),
          ),
          const SizedBox(width: 8), // Space between columns
          // Right Column
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: rightColumn,
            ),
          ),
        ],
      ),
    );
  }
}
