import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/constants/global_general_constants.dart';
import 'package:my_portfolio/core/utils/common_utils.dart';
import 'package:my_portfolio/generated/locale_keys.g.dart';
import 'package:my_portfolio/models/footer_item.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<FooterItem> footerItems = [
  FooterItem(
    iconData: Icons.location_on,
    title: LocaleKeys.location,
    text1: LocaleKeys.bishkek,
    text2: LocaleKeys.kyrgyzstan,
    onTap: null,
  ),
  FooterItem(
    iconData: Icons.phone,
    title: LocaleKeys.contact,
    text1: GlobalGeneralConstants.phone,
    text2: "",
    onTap: () {
      CommonUtil.customLaunch(link: GlobalGeneralConstants.phoneCall);
    },
  ),
  FooterItem(
    iconData: Icons.mail,
    title: LocaleKeys.email,
    text1: GlobalGeneralConstants.mail,
    text2: "",
    onTap: () {
      CommonUtil.customLaunch(link: GlobalGeneralConstants.mailTo);
    },
  ),
  FooterItem(
    iconData: FontAwesomeIcons.whatsapp,
    title: LocaleKeys.wa,
    text1: GlobalGeneralConstants.phone,
    text2: "",
    onTap: () {
      CommonUtil.customLaunch(
        link: GlobalGeneralConstants.waMain,
        iosLink: GlobalGeneralConstants.waIOS,
      );
    },
  ),
];

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth, context),
      tablet: _buildUi(kTabletMaxWidth, context),
      mobile: _buildUi(getMobileMaxWidth(context), context),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveBreakpoints(
      breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
        Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50.0,
                  horizontal: 5,
                ),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: 1.0,
                  runSpacing: 10.0,
                  children: footerItems
                      .map(
                        (footerItem) => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: InkWell(
                            onTap: footerItem.onTap,
                            child: SizedBox(
                              width: ScreenHelper.isMobile(context)
                                  ? constraints.maxWidth / 2.0 - 20.0
                                  : constraints.maxWidth / 4.0 - 20.0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10.0),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        footerItem.iconData,
                                        color: kPrimaryColor,
                                        size: 28,
                                      ),
                                      const SizedBox(width: 15.0),
                                      Flexible(
                                        child: Text(
                                          context.tr(footerItem.title),
                                          style: GoogleFonts.josefinSans(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "${context.tr(footerItem.text1)}\n",
                                          style: const TextStyle(
                                            color: kCaptionColor,
                                            height: 1.8,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "${context.tr(footerItem.text2)}\n",
                                          style: const TextStyle(
                                            color: kCaptionColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 20.0),
              const Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Developed in 💛 with Flutter",
                      style: TextStyle(color: kCaptionColor),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    ),
  );
}
