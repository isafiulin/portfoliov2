import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/common_utils.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/generated/locale_keys.g.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/provider/theme.dart';

class WorkSection extends StatelessWidget {
  final List<ProjectModel> projects;
  const WorkSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(context),
      tablet: _buildUi(context),
      mobile: _buildUi(context),
    );
  }

  Widget _buildUi(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Center(
        child: Wrap(
          children: projects
              .map((e) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: _buildProject(e)))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildProject(ProjectModel projectModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: 400,
          child: Consumer(builder: (context, ref, _) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ref.watch(themeProvider).isDarkMode
                      ? const Color.fromARGB(75, 12, 12, 7)
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(5)),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  if (projectModel.appPhotos != null)
                    Image.asset(
                      projectModel.appPhotos!,
                      width: constraints.maxWidth > 720.0 ? null : 350.0,
                      height: 250,
                    ),
                  const SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projectModel.project,
                          style: GoogleFonts.josefinSans(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          projectModel.title,
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            fontSize: 28.0,
                          ),
                        ).tr(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          projectModel.description,
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            color: kCaptionColor,
                          ),
                        ).tr(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        projectModel.techUsed.isEmpty
                            ? Container()
                            : Text(
                                context.tr(LocaleKeys.techUsed),
                                style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16.0,
                                ),
                              ),
                        Wrap(
                          children: projectModel.techUsed
                              .map((e) => Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 25,
                                    height: 25,
                                    child: Image.asset(e.logo),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      kPrimaryColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (projectModel.internalLink) {
                                      context.goNamed(projectModel.projectLink);
                                    } else {
                                      CommonUtil()
                                          .openUrl(projectModel.projectLink);
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      (projectModel.buttonText != null
                                              ? tr(projectModel.buttonText!)
                                              : "Explore MORE")
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                      ),
                                    ).tr(),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            if (projectModel.projectLink2 != null)
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        kPrimaryColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (projectModel.internalLink) {
                                        context
                                            .goNamed(projectModel.projectLink);
                                      } else {
                                        CommonUtil().openUrl(
                                            projectModel.projectLink2 ?? '');
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        (projectModel.buttonText2 != null
                                                ? tr(projectModel.buttonText2!)
                                                : "Explore MORE")
                                            .toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        ),
                                      ).tr(),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  )
                  // Expanded(
                  //   flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  //   child: ,
                  // )
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
