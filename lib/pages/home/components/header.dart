import 'package:countries_flag/countries_flag.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/routes/routes.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/globals.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/generated/locale_keys.g.dart';
import 'package:my_portfolio/models/header_item.dart';
import 'package:my_portfolio/provider/home.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              context.go(Routes.home);
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Flutter",
                    style: GoogleFonts.josefinSans(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: ref.watch(themeProvider).isDarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "Dev",
                    style: GoogleFonts.josefinSans(
                      color: kPrimaryColor,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key, required this.themeSwitch});
  final Widget themeSwitch;

  static List<NameOnTap> get headerItems => [
        NameOnTap(
          title: tr(LocaleKeys.home),
          iconData: Icons.home,
          onTap: () {},
        ),
        NameOnTap(
          title: tr(LocaleKeys.aboutMe),
          onTap: () {},
          iconData: Icons.info,
        ),
        NameOnTap(
          title: tr(LocaleKeys.projects),
          onTap: () {},
          iconData: Icons.work,
        ),
        NameOnTap(
          title: tr(LocaleKeys.contact),
          onTap: () {},
          iconData: Icons.contact_mail,
        ),
        NameOnTap(
          title: tr(LocaleKeys.themes),
          onTap: () {},
          iconData: Icons.light_mode_outlined,
          isDarkTheme: true,
        ),
        NameOnTap(
          title: "LanguageSwitch",
          onTap: () {},
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleConditions: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Consumer(
        builder: (context, ref, child) {
          return Row(children: [
            ...headerItems.map(
              (item) => item.title == tr(LocaleKeys.themes) ||
                      item.title == 'LanguageSwitch'
                  ? const Text("")
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: const EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            item.onTap();
                            HomeProvider _homeProvider = ref.read(homeProvider);
                            _homeProvider.scrollBasedOnHeader(item);
                          },
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color:
                                  item.title == "Blogs" ? kPrimaryColor : null,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
            themeSwitch
          ]);
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key, required this.themeSwitch});
  final Widget themeSwitch;

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: buildHeader(context, themeSwitch),
      mobile: buildMobileHeader(context),
      tablet: buildHeader(context, themeSwitch),
    );
  }

  // mobile header
  Widget buildMobileHeader(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(
                Icons.menu,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader(BuildContext context, Widget themeSwitch) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.isDesktop(context) ? 24 : 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeaderLogo(),
            HeaderRow(
              themeSwitch: themeSwitch,
            ),
            const SizedBox(
              width: 16,
            ),
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
        ),
      ),
    );
  }
}
