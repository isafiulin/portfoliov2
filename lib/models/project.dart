import 'package:my_portfolio/core/constants/asset_image.dart';
import 'package:my_portfolio/generated/locale_keys.g.dart';
import 'package:my_portfolio/models/link.dart';
import 'package:my_portfolio/models/technology.dart';

class ProjectModel {
  final String project;
  final String title;
  final String description;
  final String? appPhotos;
  final String projectLink;
  final String? projectLink2;

  final bool internalLink;
  final List<TechnologyModel> techUsed;
  List<LinkModel>? links = [];
  final String? buttonText;
  final String? buttonText2;

  ProjectModel({
    required this.project,
    required this.title,
    required this.description,
    this.appPhotos,
    required this.projectLink,
    this.projectLink2,
    this.internalLink = false,
    required this.techUsed,
    this.buttonText,
    this.buttonText2,
    this.links,
  });

  static List<ProjectModel> projects = [
    ProjectModel(
      project: "Flutter APP",
      title: "Zombies Game",
      description: LocaleKeys.zombiesGameDesc,
      projectLink: 'https://github.com/isafiulin/zombies_game',
      internalLink: false,
      techUsed: [
        TechnologyConstants.flutter,
      ],
      buttonText: LocaleKeys.github,
    ),
    ProjectModel(
      project: "Flutter APP",
      title: "Mama Space",
      description: LocaleKeys.mamaSpaceDes,
      appPhotos: AssetImageConstant.mamaspace,
      projectLink:
          'https://play.google.com/store/apps/details?id=space.eiwa.mamaspace',
      internalLink: false,
      techUsed: [
        TechnologyConstants.flutter,
      ],
      buttonText: LocaleKeys.androidlink,
      buttonText2: LocaleKeys.iosLink,
    ),
    ProjectModel(
      project: "Flutter APP",
      title: "LoyGift apps",
      description: LocaleKeys.loygiftDes,
      appPhotos: AssetImageConstant.loygift,
      projectLink:
          'https://play.google.com/store/apps/details?id=com.japanexpress.app.loygift',
      projectLink2: 'https://apps.apple.com/kg/app/japan-express/id6478541162',
      internalLink: false,
      techUsed: [
        TechnologyConstants.flutter,
      ],
      buttonText: LocaleKeys.androidlink,
      buttonText2: LocaleKeys.iosLink,
    ),
    ProjectModel(
      project: "Flutter APP",
      title: "Iskender Home",
      description: LocaleKeys.iskenderDes,
      appPhotos: AssetImageConstant.iskender,
      projectLink:
          'https://play.google.com/store/apps/details?id=com.iskender.shop',
      projectLink2: 'https://apps.apple.com/kg/app/iskender-homes/id6468029366',
      internalLink: false,
      techUsed: [
        TechnologyConstants.flutter,
      ],
      buttonText: LocaleKeys.androidlink,
      buttonText2: LocaleKeys.iosLink,
    ),
    ProjectModel(
      project: "Flutter APP",
      title: "Indenim",
      description: LocaleKeys.indenimCRMDesc,
      appPhotos: AssetImageConstant.indenimcrm,
      projectLink:
          'https://play.google.com/store/apps/details?id=uz.indenim.indenim',
      projectLink2: 'https://apps.apple.com/kg/app/indenim/id6478480695',
      internalLink: false,
      techUsed: [
        TechnologyConstants.flutter,
      ],
      buttonText: LocaleKeys.androidlink,
      buttonText2: LocaleKeys.iosLink,
    ),
    ProjectModel(
      project: "Flutter APP",
      title: "Indenim PDA",
      description: LocaleKeys.indenimPDADes,
      appPhotos: AssetImageConstant.indenimpda,
      projectLink:
          'https://play.google.com/store/apps/details?id=uz.indenim.pda',
      internalLink: false,
      techUsed: [
        TechnologyConstants.flutter,
      ],
      buttonText: LocaleKeys.androidlink,
      buttonText2: LocaleKeys.iosLink,
    ),
    ProjectModel(
      project: "Flutter App",
      title: LocaleKeys.sanoTitlle,
      description: LocaleKeys.sanoDes,
      appPhotos: AssetImageConstant.sano,
      projectLink:
          'https://play.google.com/store/apps/details?id=io.sanoapp.sano',
      projectLink2:
          'https://apps.apple.com/kg/app/sano-%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0-%D1%83%D1%87%D0%B5%D1%82%D0%B0-%D0%B4%D0%BB%D1%8F-%D0%BC%D1%81%D0%B1/id1579276248',
      internalLink: false,
      techUsed: [
        TechnologyConstants.flutter,
      ],
      buttonText: LocaleKeys.androidlink,
      buttonText2: LocaleKeys.iosLink,
    ),
  ];

  static List<ProjectModel> demos = [
    ProjectModel(
      project: "Flutter App",
      title: "Flutter Web Portfolio",
      description: "",
      appPhotos: AssetImageConstant.portfolioGif,
      projectLink: "https://github.com/isafiulin/my_portfolio",
      techUsed: [],
      buttonText: "Github Link",
    ),
  ];
}
