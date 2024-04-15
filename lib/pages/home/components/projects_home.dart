import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/routes/routes.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/generated/locale_keys.g.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/pages/home/components/portfolio_stats.dart';
import 'package:my_portfolio/pages/home/components/project.dart';

class ProjectsHome extends StatelessWidget {
  const ProjectsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.goNamed(
              Routes.simulation,
            );
          },
          child: Text(
            context.tr(LocaleKeys.myWorks),
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              fontSize: 36,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          context.tr(LocaleKeys.hereAreMyWorks),
          style: GoogleFonts.josefinSans(
            color: Colors.grey[400],
            fontSize: 14,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                context.goNamed(
                  Routes.myWorks,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context.tr(LocaleKeys.viewAll),
                  style: GoogleFonts.josefinSans(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ProjectSection(
          projects: ProjectModel.projects.take(4).toList(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 28.0),
          child: PortfolioStats(),
        ),
      ],
    );
  }
}
