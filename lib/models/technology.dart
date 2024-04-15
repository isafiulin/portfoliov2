import 'package:my_portfolio/core/constants/asset_image.dart';

class TechnologyModel {
  final String name;
  final String logo;

  TechnologyModel(this.name, this.logo);
}

class TechnologyConstants {
  static TechnologyModel flutter =
      TechnologyModel("Flutter", AssetImageConstant.flutterImage);
  static TechnologyModel firebase =
      TechnologyModel("Firebase", AssetImageConstant.firebaseImage);
  static TechnologyModel swift =
      TechnologyModel("Swift", AssetImageConstant.swiftImage);
  static TechnologyModel kotlin =
      TechnologyModel("Kotlin", AssetImageConstant.swiftImage);

  static List<TechnologyModel> technologyLearned = [
    flutter,
    swift,
    kotlin,
    firebase,
  ];
}
