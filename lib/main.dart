import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/config/flavor_config.dart';
import 'package:vnpt_his/core/common/app_globals.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/app_themes.dart';
import 'package:vnpt_his/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:vnpt_his/routes/app_routes.dart';
import 'package:vnpt_his/utils/shared_pref_utils.dart';
import 'injection_container.dart' as di;

void initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await FlutterLocalization.instance.ensureInitialized();
  // Get chosen language from local
  AppGlobals.currentLang = await SharedPrefUtils.getLanguageId() ?? 'vi';
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  late Locale _locale;

  @override
  void initState() {
    _initializeLocale();
    super.initState();
  }

  Future<void> _initializeLocale() async {
    _locale = Locale(AppGlobals.currentLang ?? 'vi');

    _localization.init(
      mapLocales: [
        MapLocale('vi', AppLocale.VI),
        MapLocale('en', AppLocale.EN),
      ],
      initLanguageCode: AppGlobals.currentLang ?? 'vi',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {
      if (locale != null) {
        _locale = locale;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsBloc(),
      child:
          BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
        return MaterialApp.router(
          title: FlavorConfig.instance.values.appName,
          routerConfig: goRouter,
          locale: _locale,
          supportedLocales: _localization.supportedLocales,
          localizationsDelegates: _localization.localizationsDelegates,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: state.darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        );
      }),
    );
  }
}
