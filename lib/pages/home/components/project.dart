import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/common_utils.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/generated/locale_keys.g.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/pages/home/home.dart';
import 'package:my_portfolio/provider/theme.dart';

class ProjectSection extends StatelessWidget {
  final List<ProjectModel> projects;
  const ProjectSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth, context),
      tablet: _buildUi(kTabletMaxWidth, context),
      mobile: _buildUi(getMobileMaxWidth(context), context),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: projects
              .map(
                (e) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  child: _buildProject(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Center _buildProject(ProjectModel projectModel) {
    return Center(
      child: SizedBox(
        height: 400.h,
        child: Consumer(
          builder: (context, ref, _) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: ref.watch(themeProvider).isDarkMode
                      ? const Color.fromARGB(75, 12, 12, 7)
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    if (projectModel.appPhotos != null)
                      SizedBox(
                        width: ScreenHelper.isMobile(context) ? 180.w : 180.w,
                        child: Image.asset(
                          projectModel.appPhotos!,
                          width: 180.w,
                          height: 250.h,
                        ),
                      ),

                    SizedBox(width: 20.w, height: 20.h),
                    SizedBox(
                      width: 180.w,
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
                          ).tr(),
                          const SizedBox(height: 15.0),
                          Text(
                            context.tr(projectModel.title),
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 28.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            context.tr(projectModel.description),
                            style: const TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 15.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 20.0),
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
                                .map(
                                  (e) => Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 25,
                                    height: 25,
                                    child: Image.asset(e.logo),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 25.0),
                          Wrap(
                            spacing: 10.w,
                            runSpacing: 10.h,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: SizedBox(
                                  height: 50.h,
                                  width: 100.w,
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        kPrimaryColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (projectModel.internalLink) {
                                        context.goNamed(
                                          projectModel.projectLink,
                                        );
                                      } else {
                                        CommonUtil().openUrl(
                                          projectModel.projectLink,
                                        );
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
                              const SizedBox(width: 8),
                              if (projectModel.projectLink2 != null)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: SizedBox(
                                    height: 50.h,
                                    width: 100.w,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          kPrimaryColor,
                                        ),
                                      ),
                                      onPressed: () {
                                        if (projectModel.internalLink) {
                                          context.goNamed(
                                            projectModel.projectLink,
                                          );
                                        } else {
                                          CommonUtil().openUrl(
                                            projectModel.projectLink2 ?? '',
                                          );
                                        }
                                      },
                                      child: Center(
                                        child: Text(
                                          (projectModel.buttonText2 != null
                                              ? tr(projectModel.buttonText2!)
                                              : "Explore MORE"),
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
                          ),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    //   child: ,
                    // )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
