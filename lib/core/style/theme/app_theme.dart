import 'package:flutter/material.dart';
import 'package:pizza_app/core/style/colors/colors_dark.dart';
import 'package:pizza_app/core/style/colors/colors_light.dart';
import 'package:pizza_app/core/style/theme/color_extention.dart';

ThemeData themeDark(){
  return ThemeData(
            scaffoldBackgroundColor: ColorsDark.mainColor,
            useMaterial3: true,
            extensions: <ThemeExtension<dynamic>>[
              MyColor.dark,
            ], 
          );
}
ThemeData themeLight(){
  return ThemeData(
            scaffoldBackgroundColor: ColorsLight.mainColor,
            useMaterial3: true,
            extensions: <ThemeExtension<dynamic>>[
              MyColor.light,
            ],
          );
}