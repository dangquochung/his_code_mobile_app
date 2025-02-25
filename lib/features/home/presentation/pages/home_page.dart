import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/widgets/base_loading_widget.dart';
import 'package:vnpt_his/core/common/widgets/base_title_text.dart';
import 'package:vnpt_his/features/biometric_auth/domain/usecases/authenticate_and_get_pdf.dart';
import 'package:vnpt_his/features/biometric_auth/presentation/bloc/biometric_auth_bloc.dart';
import 'package:vnpt_his/features/biometric_auth/presentation/pages/biometric_auth_page.dart';
import 'package:vnpt_his/features/home/presentation/bloc/home_event.dart';
import 'package:vnpt_his/features/home/presentation/bloc/home_state.dart';
import 'package:vnpt_his/features/home/presentation/pages/ios_webview_screen.dart';
import 'package:vnpt_his/features/home/presentation/pages/native_feature_page.dart';
import 'package:vnpt_his/features/home/presentation/widgets/home_appoinment.dart';
import 'package:vnpt_his/features/home/presentation/widgets/home_card_swiper.dart';
import 'package:vnpt_his/features/home/presentation/widgets/home_feature_grid.dart';
import 'package:vnpt_his/features/home/presentation/widgets/home_search_bar.dart';
import 'package:vnpt_his/features/notification/presentation/bloc/notification_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_header.dart';
import '../widgets/home_slide.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && mounted) {
      context.read<HomeBloc>().add(LoadFeaturesEvent());
    }
  }

  static const platform = MethodChannel('com.vnptit.vnpt.homeclinic/webview');

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();

    // Thêm LoadFeaturesEvent nếu bloc đang ở trạng thái ban đầu
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (homeBloc.state is HomeInitial) {
        homeBloc.add(LoadFeaturesEvent());
      }
    });

    return BlocProvider(
      create: (_) => NotificationCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    action: SnackBarAction(
                      label: 'Dismiss',
                      onPressed: () {
                        context.read<HomeBloc>().add(ClearError());
                      },
                    ),
                  ),
                );
              } else if (state is NavigateToFeaturePage) {
                final feature = state.feature;
                if (feature.isMiniApp) {
                  if (Platform.isIOS) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IOSWebViewPage(
                          url: feature.bundle,
                          title: feature.title,
                        ),
                      ),
                    );
                    if (mounted) {
                      context.read<HomeBloc>().add(ReturnToHomeEvent());
                    }
                  } else if (Platform.isAndroid) {
                    platform.invokeMethod('openWebView', {
                      "url": feature.bundle,
                      "bundleId": feature.bundleId,
                      "title": feature.title,
                      "iconUrl": feature.iconUrl,
                    }).then((_) {
                      if (mounted) {
                        context.read<HomeBloc>().add(ReturnToHomeEvent());
                      }
                    }).catchError((error) {
                      if (mounted) {
                        context.read<HomeBloc>().add(ReturnToHomeEvent());
                      }
                    });
                  }
                } else {
                  // Xử lý native feature và reset state
                  if (feature.bundleId == 'native1') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider<BiometricAuthBloc>(
                          create: (_) => BiometricAuthBloc(
                            authenticateAndGetPdf: sl<AuthenticateAndGetPdf>(),
                          ),
                          child: const BiometricAuthPage(),
                        ),
                      ),
                    );
                  } else if (feature.bundleId == 'native2') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NativeFeaturePage(feature: feature),
                      ),
                    );
                  }
                  if (mounted) {
                    context.read<HomeBloc>().add(ReturnToHomeEvent());
                  }
                }
              }
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading || state is HomeInitial) {
                  return const BaseLoadingWidget();
                }
                if (state is HomeLoaded) {
                  return Column(
                    children: [
                      const HomeHeader(doctorName: "Phạm Đình Khang"),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              buildSearchBar(context),
                              buildAppointmentSection(context, 4, state),
                              buildCardSwiper(),
                              const SizedBox(height: 32),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: BaseTitleText(
                                    title: AppLocale.mainFeature
                                        .getString(context),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              buildFeaturesGrid(context, state),
                              const HomeSlider(
                                height: 200,
                                autoPlayInterval: Duration(seconds: 3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink(); // Fallback widget
              },
            ),
          ),
        ),
      ),
    );
  }
}
