import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/constants/global_general_constants.dart';
import 'package:my_portfolio/core/routes/routes.dart';
import 'package:my_portfolio/provider/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final theme = ref.watch(themeProvider);
        return MaterialApp.router(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          title: GlobalGeneralConstants.myName,
          debugShowCheckedModeBanner: false,
          themeMode: theme.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          routerConfig: RouterGenerator.router,
        );
      },
    );
  }
}
