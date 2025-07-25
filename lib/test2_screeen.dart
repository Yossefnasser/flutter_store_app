import 'package:flutter/material.dart';
import 'package:pizza_app/core/extentions/context_extentions.dart';
import 'package:pizza_app/core/style/fonts/font_weight_helper.dart';

class Test2Screeen extends StatelessWidget {
  const Test2Screeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.primaryColor ?? Colors.white ,
      appBar: AppBar(
        title: const Text('Test Screen 2'),
      ),
      body: const Center(
        child: Text(
          '2222222222',
          style: TextStyle(
            fontWeight: FontWeightHelper.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}