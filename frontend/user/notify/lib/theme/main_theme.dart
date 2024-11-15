import 'package:flutter/material.dart';

ThemeData mainTheme(BuildContext context, Color color, bool isDarkTheme) {
  ThemeData tempTheme = ThemeData(
    brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    colorSchemeSeed: color,
  );

  return ThemeData(
    brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    colorSchemeSeed: color,
    useMaterial3: true,
    textTheme: TextTheme(
      labelMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(
          fontSize: 65, color: tempTheme.colorScheme.onPrimaryContainer),
      titleMedium: const TextStyle(fontSize: 30),
      titleSmall: const TextStyle(fontSize: 20),
      labelSmall: TextStyle(
          fontSize: 15,
          color: tempTheme.colorScheme.onSurface.withOpacity(0.7)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          fontSize: 17,
          color: tempTheme.colorScheme.onSurface.withOpacity(0.4)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(tempTheme.colorScheme.primary),
          foregroundColor:
              WidgetStatePropertyAll(tempTheme.colorScheme.onPrimary),
          minimumSize: WidgetStatePropertyAll(
              Size(MediaQuery.sizeOf(context).width - 70, 50)),
          textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 20))),
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        elevation: WidgetStatePropertyAll(0),
        textStyle: WidgetStatePropertyAll(
            TextStyle(fontSize: 15, decoration: TextDecoration.underline)),
      ),
    ),
  );
}
