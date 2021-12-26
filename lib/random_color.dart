library colors_stuff;

import 'dart:math';

import 'package:flutter/material.dart';

/// Handles generation of random dark colors.
class RandomColor {
  ///
  /// Random color mode.
  /// We are going to have 2 modes:
  /// 1. One-primary
  /// 2. Two-primary
  ///
  /// For One-primary, we are going to have one primary shade with value
  /// more than 192, and other 2 shades with values less than 64. Among the 2 shades, we can
  /// optionally have the values to be 0.
  ///
  /// For Two-primary, we are going to have 2 primary shades with value ranging from 64-128,
  /// while the other one will have value less than 0.
  final int _onePrimary = 0;
  final int _twoPrimary = 1;

  /// Returns a random dark color based on one-primary mode logic.
  Color _getOnePrimaryRandomColor() {
    // RGB values
    var rgb = [0, 0, 0];

    // Determine a dominant index
    var dominantIndex = Random().nextInt(3);
    rgb[dominantIndex] = 128 + Random().nextInt(64);

    for (var i = 0; i < 3; i += 1) {
      if (rgb[i] == 0) {
        var coEff = Random().nextInt(2);
        rgb[i] = coEff * Random().nextInt(32);
      }
    }

    return Color.fromARGB(255, rgb[0], rgb[1], rgb[2]);
  }

  /// Returns a random dark color based on two-primary mode logic.
  Color _getTwoPrimaryRandomColor() {
    // RGB values
    var rgb = [0, 0, 0];

    // Determine a dominant index
    var dominantIndex = Random().nextInt(3);
    rgb[dominantIndex] = 80 + Random().nextInt(48);

    // Determine the second dominant index
    var secondDominantIndex = 1 + Random().nextInt(2);
    rgb[(dominantIndex + secondDominantIndex) % 3] = 80 + Random().nextInt(48);

    for (var i = 0; i < 3; i += 1) {
      if (rgb[i] == 0) {
        var coEff = Random().nextInt(2);
        rgb[i] = coEff * Random().nextInt(32);
      }
    }

    return Color.fromARGB(255, rgb[0], rgb[1], rgb[2]);
  }

  /// Returns a random dark color.
  /// The mode can be optionally specified, which has to be either
  /// 1 (for one-primary) or 2 (for two-primary). Any other value will
  /// result in a random mode.
  Color getRandomDarkColor({int mode = -1}) {
    int logic = mode < 0 || mode > 1 ? Random().nextInt(2) : mode;
    return logic == _onePrimary
        ? _getOnePrimaryRandomColor()
        : _getTwoPrimaryRandomColor();
  }
}
