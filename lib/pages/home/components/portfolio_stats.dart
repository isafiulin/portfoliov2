import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/generated/locale_keys.g.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/models/stat.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<Stat> stats = [
  Stat(count: "${ProjectModel.projects.length}+", text: LocaleKeys.projects),
  Stat(
    count: (DateTime.now().year - 2022).toString(),
    text: LocaleKeys.yearsExperience,
  ),
];

class PortfolioStats extends StatelessWidget {
  const PortfolioStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return ResponsiveBreakpoints(
      breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
        Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          return Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            children: stats.map((stat) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                // Just use the helper here really
                width: ScreenHelper.isMobile(context)
                    ? constraint.maxWidth / 2.0 - 20
                    : (constraint.maxWidth / 4.0 - 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      stat.count,
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 32.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      context.tr(stat.text),
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: kCaptionColor,
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
