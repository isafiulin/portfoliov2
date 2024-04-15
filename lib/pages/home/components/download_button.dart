import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/constants/global_general_constants.dart';
import 'package:my_portfolio/core/utils/common_utils.dart';
import 'package:my_portfolio/generated/locale_keys.g.dart';
import 'package:my_portfolio/provider/theme.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () async {
              String link = GlobalGeneralConstants.enCV;
              if (context.locale.languageCode == "ru") {
                link = GlobalGeneralConstants.ruCV;
              }
              await CommonUtil.customLaunch(link: link);
            },
            child: Container(
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
                  Text(
                    context.tr(LocaleKeys.downloadCV),
                    style: GoogleFonts.josefinSans(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
