import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:my_portfolio/core/utils/package.dart';
import 'package:my_portfolio/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonUtil {
  static bool isSnackBarScheduled = false;

  static Future<void> customLaunch({
    String? iosLink,
    required String link,
    String? errorMessage,
  }) async {
    Uri uri;
    if (PlatformUtils.isIOS) {
      uri = Uri.parse(iosLink ?? link);
    } else {
      uri = Uri.parse(link);
    }
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      try {
        await launchUrl(uri);
      } catch (exc) {
        showSnackBar(errorMessage ?? LocaleKeys.baseError.tr());
      }
    }
  }

  static void showSnackBar(
    String message, {
    Color messageColor = Colors.black,
  }) {
    Future.delayed(const Duration(milliseconds: 500), () {
      SmartDialog.showToast('',
              // displayTime: const Duration(seconds: 2),
              builder: (context) => Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 10,
                            spreadRadius: 3,
                            color: Color.fromRGBO(26, 42, 97, 0.06),
                          ),
                        ],
                      ),
                      child: Text(
                        message,
                        style: TextStyle(color: messageColor, fontSize: 16),
                      ),
                    ),
                  ),
              alignment: Alignment.topLeft,
              maskColor: Colors.transparent)
          .then((value) => isSnackBarScheduled = false);
    });
  }

  static Future<void> showSnackBarWidget(BuildContext context,
      {required Widget widgetM, required Function funcThen}) async {
    await SmartDialog.show(
      displayTime: const Duration(seconds: 1),
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
        child: Container(
          width: 281,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 10,
                spreadRadius: 3,
                color: Color.fromRGBO(26, 42, 97, 0.06),
              ),
            ],
          ),
          child: widgetM,
        ),
      ),
      alignment: Alignment.center,
    );
    funcThen();
  }

  static void dismiss() {
    SmartDialog.dismiss();
  }

  Future<void> openUrl(String url) async {
    final url0 = Uri.parse(url);
    if (!await launchUrl(url0, mode: LaunchMode.externalApplication)) {
      // <--
      throw Exception('Could not launch $url0');
    }
  }
}
