import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/pages/demo/demo.dart';
import 'package:my_portfolio/pages/home/home.dart';
import 'package:my_portfolio/pages/splash/splash_view.dart';
import 'package:my_portfolio/pages/works/works.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Routes {
  static const String initial = "/";
  static const String home = "/home";
  static const String demos = "demos";
  static const String myWorks = "works";
  static const String simulation = "simulation";
}

class RouterGenerator {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.initial,
        builder: (context, state) => const _AppResponsiveBuilder(
          child: SplashView(),
        ),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const _AppResponsiveBuilder(
          child: Home(),
        ),
        routes: [
          GoRoute(
            path: Routes.demos,
            name: Routes.demos,
            builder: (context, state) =>
                const _AppResponsiveBuilder(child: DemoScreen()),
          ),
          GoRoute(
            path: Routes.myWorks,
            name: Routes.myWorks,
            builder: (context, state) =>
                const _AppResponsiveBuilder(child: MyWorksScreen()),
          ),
          GoRoute(
            path: Routes.simulation,
            name: Routes.simulation,
            builder: (context, state) =>
                const _AppResponsiveBuilder(child: SizedBox()),
          ),
        ],
      ),
    ],
  );
}

class _AppResponsiveBuilder extends StatelessWidget {
  final Widget child;
  const _AppResponsiveBuilder({required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      child: ClampingScrollWrapper.builder(context, child),
      breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
    );
  }
}
