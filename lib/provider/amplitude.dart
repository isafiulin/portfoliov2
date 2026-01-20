import 'dart:developer';

import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/base_event.dart';
import 'package:amplitude_flutter/events/event_options.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:my_portfolio/core/constants/environment.dart';

final amplitudeProvider =
    ChangeNotifierProvider(((ref) => AmplitudeProvider()));

class AmplitudeProvider extends ChangeNotifier {
  Amplitude? analytics;
  late DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  AmplitudeProvider() {
    initAmplitude();
  }
  Future<void> initAmplitude() async {
    analytics = Amplitude(Configuration(
      apiKey: AppEnvironment.amplitudeAPIKey,
      flushIntervalMillis: 50000,
      flushQueueSize: 20,
    ));
    analytics?.isBuilt;
  }

  Future<void> logStartupEvent() async {
    Map<String, String> info = {};
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;

      info.addAll({
        "browser": webBrowserInfo.browserName.name,
        "platform": webBrowserInfo.platform.toString(),
        "userAgent": webBrowserInfo.userAgent.toString(),
        "product": webBrowserInfo.product.toString(),
        "vendor": webBrowserInfo.vendor.toString(),
        "language": webBrowserInfo.language.toString(),
      });
    }
    log("info: $info");

    analytics?.track(BaseEvent('startup'), EventOptions(extra: info));
  }

  Future<void> logAScreen(String screenName) async {
    Map<String, String> info = {};

    info.addAll({
      "screenName": screenName,
    });

    log("info: $info");
    analytics?.track(BaseEvent('screens_log'), EventOptions(extra: info));

    // analytics?.logEvent('screens_log', eventProperties: info);
  }

  Future<void> logJsonParseError(Map<String, dynamic> json) async {
    log("info: $json");
    analytics?.track(BaseEvent('json_parse_error'), EventOptions(extra: json));
  }
}
