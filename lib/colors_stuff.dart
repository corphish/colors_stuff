library colors_stuff;

import 'dart:math';

import 'package:colors_stuff/random_color.dart';
import 'package:flutter/material.dart';

/// Checks if the given [color] is dark.
/// This is done by checking if the luminance of the color is less than the
/// assertionFactor or not. The default value for the assertionFactor is 0.5.
bool isColorDark(Color color, {double assertionFactor = 0.5}) {
  final luminance = color.computeLuminance();
  return luminance < assertionFactor;
}

/// Checks if the given [color] is light.
/// This is done by checking if the luminance of the color is greater than the
/// assertionFactor or not. The default value for the assertionFactor is 0.5.
bool isColorLight(Color color, {double assertionFactor = 0.5}) {
  final luminance = color.computeLuminance();
  return luminance > assertionFactor;
}

/// Returns a darker version of the given [color]. The amount of darkening is
/// specified by the [amount] parameter. The default value of the amount is 0.1.
Color darkenColor(Color color, {double amount = 0.1}) {
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return hslDark.toColor();
}

/// Returns a lighter version of the given [color]. The amount of lightening is
/// specified by the [amount] parameter. The default value of the amount is 0.1.
Color lightenColor(Color color, {double amount = 0.1}) {
  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return hslLight.toColor();
}

/// Returns a random dark color.
/// The mode can be optionally specified, which has to be either
/// 1 (for one-primary) or 2 (for two-primary). Any other value will
/// result in a random mode.
Color randomDarkColor({int mode = -1}) {
  return RandomColor().getRandomDarkColor();
}

/// Returns a random light color.
/// The mode can be optionally specified, which has to be either
/// 1 (for one-primary) or 2 (for two-primary). Any other value will
/// result in a random mode.
Color randomLightColor({int mode = -1}) {
  Color dark = RandomColor().getRandomDarkColor();
  int r = 255 - dark.red;
  int g = 255 - dark.green;
  int b = 255 - dark.blue;

  return Color.fromARGB(255, r, g, b);
}

/// Returns a random color.
Color randomColor() {
  return Random().nextInt(2) == 0 ? randomLightColor() : randomDarkColor();
}

/// Increases the alpha of the given [color] by the given [amount].
Color increaseAlpha(Color color, {double amount = 0.1}) {
  return color.withOpacity((color.opacity + amount).clamp(0.0, 1.0));
}

/// Decreases the alpha of the given [color] by the given [amount].
Color reduceAlpha(Color color, {double amount = 0.1}) {
  return color.withOpacity((color.opacity - amount).clamp(0.0, 1.0));
}

/// Returns a color that would be suitable to be drawn on a surface whose
/// color is the given [surfaceColor]. If the surface color is dark, then
/// the returned color will be light, otherwise it will be dark.
/// By default, white color will be returned if the surface color is dark,
/// and black color will be returned if the surface color is light.
Color getOnSurfaceColor(Color surfaceColor,
    {Color colorIfDark = Colors.white, Color colorIfLight = Colors.black}) {
  return isColorDark(surfaceColor) ? colorIfDark : colorIfLight;
}
