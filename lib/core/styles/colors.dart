import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static final raw = ThemeColor(
    light: KColors.light,
    dark: KColors.dark,
  );

  static final primary = ThemeColor(
    light: Colors.blue,
    dark: Colors.white.t75,
  );

  static final secondary = ThemeColor(
    light: Colors.blueGrey,
    dark: Colors.blueGrey,
  );

  static final ternary = ThemeColor(
    light: Colors.grey,
    dark: Colors.grey,
  );

  static final background = ThemeColor(
    light: Colors.white,
    dark: Colors.black,
  );

  static final error = ThemeColor(
    light: Colors.red,
    dark: Colors.red,
  );

  static final disable = ThemeColor(
    light: Colors.grey,
    dark: Colors.grey,
  );

  static final overlayColor = ThemeColor(
    light: Colors.white,
    dark: DarkColors.darkJungleGreen,
  );

  static final bottomSheet = ThemeColor(
    light: Colors.white,
    dark: DarkColors.darkJungleGreen,
  );

  static final iconColor = ThemeColor(
    light: primary.dark,
    dark: primary.light,
  );

  static final titleColor = ThemeColor(
    light: DarkColors.darkJungleGreen.t75,
    dark: LightColors.gainsBoro.t75,
  );

  static final textColor = ThemeColor(
    light: Colors.white,
    dark: Colors.white,
  );

  static final colorScheme = ThemeColorScheme.fromThemeColor(
    primary: primary,
    secondary: secondary,
    ternary: ternary,
    error: error,
    background: background,
  );
}
