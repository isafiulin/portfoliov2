import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/utils/common_utils.dart';
import 'package:my_portfolio/models/header_item.dart';

class GlobalGeneralConstants {
  static const String myName = "Ilgiz Safiulin";
  static const String translationsPath = "assets/translations";
  static const String phone = '996773735554';
  static const String phoneCall = 'tel:+996773735554';
  static const String mail = 'isafiulin00@gmail.com';
  static const String mailTo = 'mailto:isafiulin00@gmail.com';

  static const String linked = '@ilgiz-safiulin-604977174';
  static const String instagramLink =
      'https://www.instagram.com/kshishkovich__';
  static const String git = '@isafiulin';

  static const String tgLink = 'tg://resolve?phone=$phone';
  static const String linkedInLink =
      'https://www.linkedin.com/in/ilgiz-safiulin-604977174/';
  static const String gitHubLink = 'https://github.com/isafiulin';
  static const String ruCV =
      'https://drive.google.com/file/d/1eycE3ONkHkUE6oTB8UkHm4HDYpVB5pAJ/view?usp=sharing';
  static const String enCV =
      'https://drive.google.com/file/d/18nnb5WO9IQDWw-uFHOS8mnDWykAONvJr/view?usp=sharing';

  static const String waIOS = 'whatsapp://wa.me/$phone';
  static const String waMain = 'https://wa.me/$phone';

  static List<NameOnTap> socialLoginDatas = [
    NameOnTap(
        title: "Email",
        iconData: Icons.mail_outline_rounded,
        onTap: () {
          CommonUtil.customLaunch(
            link: mailTo,
          );
        }),
    NameOnTap(
        title: "LinkedIN",
        iconData: FontAwesomeIcons.linkedinIn,
        onTap: () {
          CommonUtil.customLaunch(
            link: linkedInLink,
          );
        }),
    NameOnTap(
        title: "Instagram",
        iconData: FontAwesomeIcons.instagram,
        onTap: () {
          CommonUtil.customLaunch(
            link: instagramLink,
          );
        }),
    NameOnTap(
        title: "Github",
        iconData: FontAwesomeIcons.github,
        onTap: () {
          CommonUtil.customLaunch(
            link: gitHubLink,
          );
        }),
  ];
}
