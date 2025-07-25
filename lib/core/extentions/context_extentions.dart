import 'package:flutter/material.dart';
import 'package:pizza_app/core/style/theme/color_extention.dart';

extension ContextExtensions on BuildContext {
  MyColor get color {
    final colorExtension = Theme.of(this).extension<MyColor>();
    assert(colorExtension != null, 'MyColor extension is not found in ThemeData');
    return colorExtension!;
  }  
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, 
    (route) => false, arguments: arguments);
  }
}