# Colors Stuff
A library that provides useful functions for working with colors. This is a flutter port of the native Android library [colors-ktx](https://github.com/corphish/colors-ktx) library, also made by me.

## Features
- Helpers to tell if a color is dark or light.
- Helpers to lighten or darken colors.
- Helpers to manipulate alpha channel of colors.
- Helpers to generate random dark or light colors.
- `ColorSet` - A set of `background`, `foreground` and `muted foreground` colors which you can use in various UI elements of your app.

## Usage
Import the library.
```dart
import 'package:colors_stuff/colors_stuff.dart';
```

Have fun!
```dart
var color = randomColor(); // Generates a random color
var isDark = isColorDark(color); // Returns true if the color is dark

var lightColor = lightenColor(color, 0.2); // Lightens the color by 50%
var darkColor = darkenColor(color); // Darkens the color (by 10% default)

var reducedAlphaColor = reduceAlpha(color); // Reduces the alpha (by 10% default)
var increasedAlphaColor = increaseAlpha(color, 0.5); // Increases the alpha by 50%
```

But there's more!
The `ColorSet` class generates foreground and muted foreground colors for you based on the background color that you pass to it. You can also have the `ColorSet` class generate a random background color for you, which will then be used to generate corresponding foreground and muted foreground colors. You can use these colors in various UI elements of your app, without having to worry about whether the foreground color will be legible on the background or not.
```dart
var set = ColorSet.ofSomeRandomColor(); // Generates a set with random background color.
...
// Now some where in your UI logic, you have a card on which you have some text.
// You can use the set colors easily to style the card.
Card(
    color: set.backgroundColor,
    child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Text(
                "Title",
                style: TextStyle(
                    color: set.foregroundColor),
            ),
            SizedBox(height: 16),
            Text(
                "Some descriptive text",
                style: TextStyle(
                color: set.mutedForegroundColor),
            ),
        ],
        ),
    ),
),
```