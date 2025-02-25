import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/features/login/presentation/bloc/login_bloc.dart';
import 'package:vnpt_his/features/login/presentation/widgets/language_item.dart';

class MultiLangView extends StatelessWidget {
  const MultiLangView({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: MenuAnchor(
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            LanguageModel currentLang = LanguageModel.listLanguages
                .firstWhere((e) => e.id == state.languageId);
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      )),
                  child: Image.asset(
                    currentLang.iconPath,
                    width: 24,
                    height: 24,
                  )),
              tooltip: AppLocale.changeLang.getString(context),
            );
          });
        },
        menuChildren: [
          MenuItemButton(
            onPressed: () {
              context.read<LoginBloc>().add(ChooseLanguage('vi'));
            },
            child: LanguageItem(language: LanguageModel.listLanguages[0]),
          ),
          MenuItemButton(
            onPressed: () {
              context.read<LoginBloc>().add(ChooseLanguage('en'));
            },
            child: LanguageItem(language: LanguageModel.listLanguages[1]),
          )
        ],
      ),
    );
  }
}
