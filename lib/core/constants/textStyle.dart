part of 'constants.dart';

/// TextStyles
class AppTextstyle {
  AppTextstyle._();
 
 /// bigHeader
  static final bigHeader = TextStyle(
    fontSize: SizeConfig.bigHeader,
    fontWeight: FontWeight.w700,
    color: Colorz.white,
  );
  /// mediumHeader

  static final mediumHeader = TextStyle(
    fontSize: SizeConfig.mediumHeader,
    fontWeight: FontWeight.w600,
    color: Colorz.white,
  );
/// smallHeader
  static final smallHeader = TextStyle(
    fontSize: SizeConfig.smallHeader,
    fontWeight: FontWeight.w600,
    color: Colorz.white,
  );
/// subtitle
  static final  subtitleText = TextStyle(
    fontSize: SizeConfig.smallFont,
    fontWeight: FontWeight.w400,
    color: Colorz.grey,
  );
/// large subtitle
  static final largeSubtitle = TextStyle(
    fontSize: SizeConfig.largeFont,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );
}
