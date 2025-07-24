import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pizza_app/common/screens/no_network_screen.dart';
import 'package:pizza_app/core/app/connectivity_controller.dart';
import 'package:pizza_app/core/extentions/context_extentions.dart';
import 'package:pizza_app/core/routes/app_routes.dart';
import 'package:pizza_app/style/fonts/font_family_helper.dart';
import 'package:pizza_app/style/fonts/font_weight_helper.dart';
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ConnectivityController.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityController.instance.connection,
      builder: (context, isConnected, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.home,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          home: isConnected ? const HomeScreen() : const NoNetworkScreen(),
        );
      },
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Store App', style: TextStyle(fontSize: 24)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (FontFamilyHelper.language == 'English') const Text(
                  'Text AND Stuff',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: FontFamilyHelper.English,
                    fontWeight: FontWeightHelper.bold,
                    color: Colors.black,
                  ),
                ) else Text(
                'هذا هو نص تجريبي باللغة العربية',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: FontFamilyHelper.Arabic,
                  fontWeight: FontWeightHelper.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    var currentLanguage = FontFamilyHelper.getLanguage();
                    print('Current language: $currentLanguage');
                    String newlanguage ;
                    if (currentLanguage == 'English') {
                      FontFamilyHelper.language = 'Arabic';
                      newlanguage = FontFamilyHelper.getLanguage();
                    } else {
                      FontFamilyHelper.language = 'English';
                      newlanguage = FontFamilyHelper.getLanguage();
                    }
                    print('New language: $newlanguage');
                    setState(() {
                      // Toggle language for demonstration
                      FontFamilyHelper.language = newlanguage ;
                      print('Language changed to: ${FontFamilyHelper.language}');
                    });
                  },
                  child: const Text(
                    'change language',
                    style: TextStyle(
                      fontFamily: FontFamilyHelper.English,
                      fontWeight: FontWeightHelper.regular,
                    ),
                  ),
                  // Add more widgets here
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(AppRoutes.TestOne);
                  },
                  child: const Text(
                    'Test Screen 1',
                    style: TextStyle(
                      fontFamily: FontFamilyHelper.English,
                      fontWeight: FontWeightHelper.regular,
                    ),
                  )
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
