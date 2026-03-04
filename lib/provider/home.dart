import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:my_portfolio/generated/locale_keys.g.dart';
import 'package:my_portfolio/models/header_item.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeProvider());
final ScrollController scrollController = ScrollController();

class HomeProvider extends ChangeNotifier {
  final contactKey = GlobalKey();
  final portfolioKey = GlobalKey();
  final aboutKey = GlobalKey();
  final homeKey = GlobalKey();

  Future<void> scrollToContact() async {
    final context = contactKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToPortfolio() async {
    final context = portfolioKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToAbout() async {
    final context = aboutKey.currentContext;

    await _scroll(context);
  }

  Future<void> scrollToHome() async {
    final context = homeKey.currentContext;
    await _scroll(context);
  }

  Future _scroll(BuildContext? context) async {
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.linear,
      );
    }
  }

  void scrollBasedOnHeader(NameOnTap nameOnTap) {
    // Prefer robust id-based switching; fallback to localized title
    final id = nameOnTap.id;
    if (id == 'contact' || nameOnTap.title == tr(LocaleKeys.contact)) {
      scrollToContact();
    } else if (id == 'home' || nameOnTap.title == tr(LocaleKeys.home)) {
      scrollToHome();
    } else if (id == 'projects' || nameOnTap.title == tr(LocaleKeys.projects)) {
      scrollToPortfolio();
    } else if (id == 'about' || nameOnTap.title == tr(LocaleKeys.aboutMe)) {
      scrollToAbout();
    }
  }
}
