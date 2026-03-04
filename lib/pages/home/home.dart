import 'dart:ui';
import 'package:countries_flag/countries_flag.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_portfolio/core/utils/globals.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/pages/home/components/about.dart';
import 'package:my_portfolio/pages/home/components/carousel.dart';
import 'package:my_portfolio/pages/home/components/footer.dart';
import 'package:my_portfolio/pages/home/components/header.dart';

import 'package:my_portfolio/pages/home/components/projects_home.dart';
import 'package:my_portfolio/provider/home.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:my_portfolio/widgets/switch.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home>
    with SingleTickerProviderStateMixin {
  late HomeProvider _homeProvider;

  @override
  void initState() {
    _homeProvider = ref.read(homeProvider);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Post-frame initialization if needed
    });
    super.initState();
  }

  Widget _buildPage() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.isDesktop(context) ||
                      ScreenHelper.isTablet(context)
                  ? 60.w
                  : 16.0.w),
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Carousel(
                    key: _homeProvider.homeKey,
                  ),
                  SizedBox(
                    key: _homeProvider.aboutKey,
                    height: 100.0.h,
                  ),
                  const AboutSection(),
                  SizedBox(
                    key: _homeProvider.portfolioKey,
                    height: 100.0.h,
                  ),
                  const ProjectsHome(),
                  Footer(
                    key: _homeProvider.contactKey,
                  )
                ],
              ),
            ),
          ),
        ),
        Header(
          themeSwitch: CustomSwitch(
            value: ref.watch(themeProvider).isDarkMode,
            onChanged: (val) {
              ref.read(themeProvider).changeTheme(val);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                if (HeaderRow.headerItems[index].id == 'language') {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context.setLocale(const Locale('en'));
                        },
                        child: CountriesFlag(Flags.unitedStatesOfAmerica,
                            width: 16,
                            height: 16,
                            fit: BoxFit.cover,
                            alignment: Alignment.center),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {
                          context.setLocale(const Locale('ru'));
                        },
                        child: CountriesFlag(Flags.russia,
                            width: 16,
                            height: 16,
                            fit: BoxFit.cover,
                            alignment: Alignment.center),
                      ),
                    ],
                  );
                }
                return ListTile(
                  onTap: () {
                    if (Globals.scaffoldKey.currentState != null) {
                      if (Globals.scaffoldKey.currentState!.isEndDrawerOpen) {
                        Navigator.pop(context);
                        _homeProvider.scrollBasedOnHeader(
                            HeaderRow.headerItems[index]);
                      }
                    }
                  },
                  leading: Icon(
                    HeaderRow.headerItems[index].iconData,
                  ),
                  title: Text(
                    HeaderRow.headerItems[index].title,
                    style: const TextStyle(),
                  ),
                  trailing: HeaderRow.headerItems[index].isDarkTheme == true
                      ? SizedBox(
                          width: 50,
                          child: CustomSwitch(
                            value: ref.watch(themeProvider).isDarkMode,
                            onChanged: (val) {
                              ref.read(themeProvider).changeTheme(val);
                            },
                          ),
                        )
                      : null,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: HeaderRow.headerItems.length,
            ),
          ),
        ),
      ),
      body: _buildPage(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
