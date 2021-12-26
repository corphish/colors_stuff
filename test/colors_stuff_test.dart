import 'package:colors_stuff/color_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:colors_stuff/colors_stuff.dart';

void main() {
  test('Check if some specified colors are dark', () {
    const color1 = Color(0xFF000000); // black
    const color2 = Color(0xFF3333ff); // blue
    const color3 = Color(0xFFc6ffb3); // light green
    const color4 = Color(0xFFffffff); // white

    expect(isColorDark(color1), true);
    expect(isColorDark(color2), true);
    expect(isColorDark(color3), false);
    expect(isColorDark(color4), false);
  });

  test('Check if some specified colors are light', () {
    const color1 = Color(0xFF000000); // black
    const color2 = Color(0xFFffdf80); // light yellow
    const color3 = Color(0xFFff471a); // red
    const color4 = Color(0xFFffffff); // white

    expect(isColorLight(color1), false);
    expect(isColorLight(color2), true);
    expect(isColorLight(color3), false);
    expect(isColorLight(color4), true);
  });

  test('Darkening of shades', () {
    const color1 = Color(0xFFb32400); // red
    const color2 = Color(0xFFb3ff66); // green

    expect(darkenColor(color1, amount: 0.05), const Color(0xFF9a1f00));
    expect(darkenColor(color2, amount: 0.05), const Color(0xFFa6ff4c));
  });

  test('Lightening of shades', () {
    const color1 = Color(0xFF9a1f00); // red
    const color2 = Color(0xFFa6ff4c); // green

    expect(lightenColor(color1, amount: 0.05), const Color(0xFFb32400));
    expect(lightenColor(color2, amount: 0.05), const Color(0xFFb3ff66));
  });

  test('Check generation of random color', () {
    var color1 = randomColor();

    expect(color1.red >= 0 && color1.red <= 255, true);
    expect(color1.green >= 0 && color1.green <= 255, true);
    expect(color1.blue >= 0 && color1.blue <= 255, true);
  });

  test('Check generation of dark random color', () {
    var color1 = randomDarkColor();

    expect(isColorDark(color1), true);
  });

  test('Check generation of light random color', () {
    var color1 = randomLightColor();

    expect(isColorLight(color1), true);
  });

  test('Check reduction of alpha channel in color', () {
    var color1 = reduceAlpha(const Color(0xFF9a1f00));

    expect(color1, const Color(0xE69a1f00));
  });

  test('Check increase of alpha channel in color', () {
    var color1 = increaseAlpha(const Color(0xFF9a1f00));
    var color2 = increaseAlpha(const Color(0xE69a1f00));

    expect(color1, const Color(0xFF9a1f00));
    expect(color2, const Color(0xFF9a1f00));
  });

  test('Color set test', () {
    var set1 = ColorSet.of(const Color(0xFF9a1f00));
    var set2 = ColorSet.of(const Color(0xFFffdf80));

    expect(set1.foregroundColor, Colors.white);
    expect(set2.foregroundColor, Colors.black);
  });
}
