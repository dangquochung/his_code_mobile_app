import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpt_his/features/home/presentation/bloc/home_bloc.dart';
import 'package:vnpt_his/features/navigation/presentation/widgets/nav_bottom.dart';
import 'package:vnpt_his/features/category/presentation/views/category_view.dart';
import 'package:vnpt_his/features/settings/presentation/views/settings_view.dart';
import 'package:vnpt_his/injection_container.dart';
// import 'package:vnpt_his/presentation/features/home/home_features/home_hen_kham/view/man_hen_kham_ios.dart';
// import 'package:vnpt_his/presentation/features/home/home_features/home_kham_benh/view/man_kham_benh.dart';
// import 'package:vnpt_his/presentation/features/home/home_view.dart';
// import 'package:vnpt_his/presentation/features/list/list_view.dart';
// import 'package:vnpt_his/presentation/features/setting/setting_view.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../bloc/navigation_cubit.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  static const int homeIndex = 0;
  static const int listIndex = 1;
  static const int profileIndex = 2;
  static const int manKhamBenhIndex = 3;
  static const int manHenKhamIOSIndex = 4;

  @override
  Widget build(BuildContext context) {
    // GlobalKeys 
    // final GlobalKey<ManKhamBenhState> manKhamBenhKey = GlobalKey<ManKhamBenhState>();
    // final GlobalKey<ManKhamBenhState> manHenKhamKey = GlobalKey<ManKhamBenhState>();

    final List<Widget> screens = [
      BlocProvider(
        create: (_) => sl<HomeBloc>(),
        child: const HomeView(),
      ),
      const CategoryView(),
      const SettingsView(),
      // ManKhamBenh(key: manKhamBenhKey),
      // ManHenKhamIOS(key: manHenKhamKey),
    ];

    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: Builder(
        builder: (context) {
          final selectedIndex = context.watch<NavigationCubit>().state;

          // Lắng nghe sự thay đổi tab
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (selectedIndex == manKhamBenhIndex) {
              // manKhamBenhKey.currentState?.sendUserToWeb();
              // manKhamBenhKey.currentState?.sendModeToWeb();
            } else if (selectedIndex == manHenKhamIOSIndex) {
              // manHenKhamKey.currentState?.sendUserToWeb();
              // manHenKhamKey.currentState?.sendModeToWeb();
            }
          });

          return Scaffold(
            body: Container(
              color: Color.fromRGBO(233, 244, 255, 0.1),
              child: IndexedStack(
                index: selectedIndex,
                children: screens,
              ),
            ),
            bottomNavigationBar: buildBottomNavBar(context, selectedIndex, homeIndex, listIndex, profileIndex),
          );
        },
      ),
    );
  }
}