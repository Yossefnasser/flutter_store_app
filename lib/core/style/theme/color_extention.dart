import 'package:flutter/material.dart';
import 'package:pizza_app/core/style/colors/colors_dark.dart';
import 'package:pizza_app/core/style/colors/colors_light.dart';

class MyColor extends ThemeExtension<MyColor> {
  MyColor({
    required this.primaryColor,
  });

  final Color primaryColor;
  
  @override
  ThemeExtension<MyColor> copyWith({Color? primaryColor}) {
    return MyColor(primaryColor: primaryColor ?? this.primaryColor);
  }

  @override
  ThemeExtension<MyColor> lerp(covariant ThemeExtension<MyColor>? other, double t) {
    if (other is! MyColor) {
      return this;
    }
    return MyColor(primaryColor: primaryColor);
    }
  static MyColor light = MyColor(
    primaryColor: ColorsLight.mainColor,
  );
  static MyColor dark = MyColor(
    primaryColor:ColorsDark.mainColor
  );
}
  