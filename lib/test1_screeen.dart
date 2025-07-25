import 'package:flutter/material.dart';
import 'package:pizza_app/core/extentions/context_extentions.dart';
import 'package:pizza_app/core/routes/app_routes.dart';
import 'package:pizza_app/core/style/fonts/font_weight_helper.dart';

class Test1Screeen extends StatelessWidget {
  const Test1Screeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.primaryColor ?? Colors.white,
      appBar: AppBar(
        title: const Text('Test Screen 1'),
      ),
      body:  Center(
        
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ const Text(
          '11111111',
          style: TextStyle(
            fontWeight: FontWeightHelper.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.pushNamed(AppRoutes.TestTwo);
          },
          child: const Text('Go to Test Screen 2'),
        )
      ]),
      )
    );
  }
}