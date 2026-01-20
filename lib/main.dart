import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:my_portfolio/app.dart';
import 'package:my_portfolio/core/constants/global_general_constants.dart';

void configureApp() {
  usePathUrlStrategy();
}

void main() async {
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  configureApp();

  runApp(ScreenUtilInit(
    designSize: const Size(430, 932),
    minTextAdapt: true,
    splitScreenMode: true,
    fontSizeResolver: FontSizeResolvers.height,
    child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: GlobalGeneralConstants.translationsPath,
        fallbackLocale: const Locale('ru'),
        child: const ProviderScope(child: MyApp())),
  ));
}
