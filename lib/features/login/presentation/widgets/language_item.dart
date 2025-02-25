import 'package:flutter/cupertino.dart';
import 'package:vnpt_his/core/common/app_locale.dart';

class LanguageItem extends StatelessWidget {
  final LanguageModel language;

  const LanguageItem({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(language.title),
        SizedBox(width: 12),
        Image.asset(
          language.iconPath,
          height: 20,
          width: 20,
        ),
      ],
    );
  }
}
