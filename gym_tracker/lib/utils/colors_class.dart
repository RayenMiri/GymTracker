import 'package:flutter/material.dart';

class TColor {
  // Light theme colors
  static const Color _primaryColor1Light = Color(0xff92A3FD);
  static const Color _primaryColor2Light = Color(0xff9DCEFF);
  static const Color _secondaryColor1Light = Color(0xffC58BF2);
  static const Color _secondaryColor2Light = Color(0xffEEA4CE);
  static const Color _blackLight = Color(0xff1D1617);
  static const Color _grayLight = Color(0xff786F72);
  static const Color _whiteLight = Colors.white;
  static const Color _lightGrayLight = Color(0xffF7F8F8);

  // Dark theme colors
  static const Color _primaryColor1Dark = Color(0xff50568d);
  static const Color _primaryColor2Dark = Color(0xff4d749d);
  static const Color _secondaryColor1Dark = Color(0xff7943b1);
  static const Color _secondaryColor2Dark = Color(0xff9c5e7b);
  static const Color _blackDark = Color(0xffe5e5e5);
  static const Color _grayDark = Color(0xff9c9c9c);
  static const Color _whiteDark = Color(0xff1D1D1D);
  static const Color _lightGrayDark = Color(0xff2f2f2f);

  // Getters for light theme
  static Color get primaryColor1Light => _primaryColor1Light;
  static Color get primaryColor2Light => _primaryColor2Light;
  static Color get secondaryColor1Light => _secondaryColor1Light;
  static Color get secondaryColor2Light => _secondaryColor2Light;
  static Color get blackLight => _blackLight;
  static Color get grayLight => _grayLight;
  static Color get whiteLight => _whiteLight;
  static Color get lightGrayLight => _lightGrayLight;

  // Getters for dark theme
  static Color get primaryColor1Dark => _primaryColor1Dark;
  static Color get primaryColor2Dark => _primaryColor2Dark;
  static Color get secondaryColor1Dark => _secondaryColor1Dark;
  static Color get secondaryColor2Dark => _secondaryColor2Dark;
  static Color get blackDark => _blackDark;
  static Color get grayDark => _grayDark;
  static Color get whiteDark => _whiteDark;
  static Color get lightGrayDark => _lightGrayDark;

  // Getters for gradients
  static List<Color> get primaryGLight =>
      [_primaryColor2Light, _primaryColor1Light];
  static List<Color> get secondaryGLight =>
      [_secondaryColor2Light, _secondaryColor1Light];
  static List<Color> get primaryGDark =>
      [_primaryColor2Dark, _primaryColor1Dark];
  static List<Color> get secondaryGDark =>
      [_secondaryColor2Dark, _secondaryColor1Dark];

  // Methods to get colors based on theme context
  static Color primaryColor1(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? _primaryColor1Dark
        : _primaryColor1Light;
  }

  static Color primaryColor2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? _primaryColor2Dark
        : _primaryColor2Light;
  }

  static Color secondaryColor1(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? _secondaryColor1Dark
        : _secondaryColor1Light;
  }

  static Color secondaryColor2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? _secondaryColor2Dark
        : _secondaryColor2Light;
  }

  static Color black(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? _blackDark
        : _blackLight;
  }

  static Color gray(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? _grayDark
        : _grayLight;
  }

  static Color white(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? _whiteDark
        : _whiteLight;
  }

  static Color lightGray(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? _lightGrayDark
        : _lightGrayLight;
  }

  static List<Color> primaryG(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? primaryGDark
        : primaryGLight;
  }

  static List<Color> secondaryG(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? secondaryGDark
        : secondaryGLight;
  }
}
