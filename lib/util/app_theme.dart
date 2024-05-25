
import 'package:flutter/material.dart';

class AppTheme{
  //we made appTheme as a function, not as a property because we need to receive ThemeData
  //object from main.dart (bcause the object is used for textTheme property).
  //the function returns ThemeData? becuase the theme property takes ThemeData?
  //the function is static so wecan call it using the class name
  static ThemeData? appTheme(ThemeData theme){
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange, primary: Colors.deepOrange),
        useMaterial3: true,
        textTheme: theme.textTheme.copyWith(
          labelMedium: theme.textTheme.labelMedium!.copyWith(color: Colors.grey)
        ));

  }
}