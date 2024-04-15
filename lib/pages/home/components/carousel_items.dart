import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/constants/asset_image.dart';
import 'package:my_portfolio/core/constants/global_general_constants.dart';
import 'package:my_portfolio/core/utils/common_utils.dart';
import 'package:my_portfolio/generated/locale_keys.g.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:my_portfolio/core/utils/constants.dart';

import '../../../models/carousel_item_model.dart';

List<CarouselItemModel> carouselItems(
        double carouselContainerHeight, BuildContext context) =>
    List.generate(
      5,
      (index) => CarouselItemModel(
        text: SizedBox(
          height: carouselContainerHeight,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.tr(LocaleKeys.flutterDeveloper),
                      style: GoogleFonts.josefinSans(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      GlobalGeneralConstants.myName.toUpperCase(),
                      style: GoogleFonts.josefinSans(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        height: 1.3,
                        letterSpacing: 2.3,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: kCaptionColor,
                          size: 14,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Kyrgyzstan",
                          style: TextStyle(
                            color: kCaptionColor,
                            fontSize: 15.0,
                            height: 1.0,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkWell(
                        onTap: () {
                          CommonUtil.customLaunch(
                            link: GlobalGeneralConstants.tgLink,
                            errorMessage: tr(LocaleKeys.baseError),
                          );
                        },
                        child: Consumer(builder: (context, ref, _) {
                          return Container(
                            decoration: BoxDecoration(
                              color: ref.watch(themeProvider).isDarkMode
                                  ? Colors.white
                                  : Colors.black12,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            height: 48.0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28.0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.telegram,
                                  color: Colors.blue[200],
                                  size: 15,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  LocaleKeys.telegram,
                                  style: GoogleFonts.josefinSans(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                    letterSpacing: 2,
                                  ),
                                ).tr(),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: SizedBox(
                  height: carouselContainerHeight - 70,
                  child: Consumer(builder: (context, ref, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: GlobalGeneralConstants.socialLoginDatas
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: e.onTap,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.all(5),
                                    // child: Image.asset(e.title),
                                    child: Center(
                                      child: FaIcon(
                                        e.iconData,
                                        color:
                                            ref.watch(themeProvider).isDarkMode
                                                ? MyThemes.lightTheme
                                                    .scaffoldBackgroundColor
                                                : MyThemes.darkTheme
                                                    .scaffoldBackgroundColor
                                                    .withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
        image: Image.asset(
          AssetImageConstant.maskotImage,
        ),
      ),
    );
