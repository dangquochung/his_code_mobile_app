import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/widgets/base_app_bar.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: AppLocale.news.getString(context),
        needBackButton: true,
      ),
      body: SizedBox(),
    );
  }
}
