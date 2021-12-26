library colors_stuff;

import 'package:colors_stuff/colors_stuff.dart';
import 'package:flutter/material.dart';

/// ColorSet is a class that holds a surface color and the other colors
/// that can be used on elements on the surface.
/// It contains a background color, which is the surface color, a foreground
/// color and a muted foreground color.
class ColorSet {
  /// The background color of the surface.
  Color backgroundColor;

  /// The foreground color of the surface.
  Color foregroundColor;

  /// The muted foreground color of the surface.
  Color mutedForegroundColor;

  /// The constructor of the ColorSet class.
  ColorSet(
      this.backgroundColor, this.foregroundColor, this.mutedForegroundColor);

  /// Factory method to create a [ColorSet] from a given background or
  /// surface color.
  factory ColorSet.of(Color backgroundColor) {
    Color foregroundColor = getOnSurfaceColor(backgroundColor);
    Color mutedForegroundColor = reduceAlpha(foregroundColor);
    return ColorSet(backgroundColor, foregroundColor, mutedForegroundColor);
  }

  /// Factory method to create a [ColorSet] from a random background or
  /// surface color.
  factory ColorSet.ofSomeRandomColor() {
    Color backgroundColor = randomColor();
    return ColorSet.of(backgroundColor);
  }

  /// Factory method to create a [ColorSet] from a random dark background or
  /// surface color.
  factory ColorSet.ofSomeRandomDarkColor() {
    Color backgroundColor = randomDarkColor();
    return ColorSet.of(backgroundColor);
  }

  /// Factory method to create a [ColorSet] from a random light background or
  /// surface color.
  factory ColorSet.ofSomeRandomLightColor() {
    Color backgroundColor = randomLightColor();
    return ColorSet.of(backgroundColor);
  }
}
