import 'package:flutter/material.dart';
import 'package:vnpt_his/core/common/widgets/base_title_text.dart';

class ContentWithTitleWidget extends StatelessWidget {
  final String? title;
  final Widget? childrenWidget;

  const ContentWithTitleWidget({super.key, this.title, this.childrenWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BaseTitleText(
              title: title ?? '',
            ),
          ),
          childrenWidget ?? SizedBox()
        ],
      ),
    );
  }
}
