# Example
Usage of the various helpers provided by the library.
```dart
var color = randomColor(); // Generates a random color
var isDark = isColorDark(color); // Returns true if the color is dark

var lightColor = lightenColor(color, 0.2); // Lightens the color by 50%
var darkColor = darkenColor(color); // Darkens the color (by 10% default)

var reducedAlphaColor = reduceAlpha(color); // Reduces the alpha (by 10% default)
var increasedAlphaColor = increaseAlpha(color, 0.5); // Increases the alpha by 50%
```

Example of `ColorSet` usage.
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