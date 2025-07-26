import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pizza_app/core/app/common/screens/no_network_screen.dart';
import 'package:pizza_app/core/app/connectivity_controller.dart';
import 'package:pizza_app/core/extentions/context_extentions.dart';
import 'package:pizza_app/core/language/app_localizations_setup.dart';
import 'package:pizza_app/core/language/lang_keys.dart';
import 'package:pizza_app/core/routes/app_routes.dart';
import 'package:pizza_app/core/style/fonts/font_family_helper.dart';
import 'package:pizza_app/core/style/fonts/font_weight_helper.dart';
import 'package:pizza_app/core/style/theme/app_theme.dart';

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
          theme: themeLight(),
          darkTheme: themeDark(),
          debugShowCheckedModeBanner: false,
          locale: Locale('en'),
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          localeResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallback,
          title: 'Store App',
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
      minTextAdapt: true,
      builder:
          (_, child) => Scaffold(
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
                    Text(
                      context.translate(LangKeys.appName),
                      style:const TextStyle(
                        fontSize: 20,
                        fontFamily: FontFamilyHelper.English,
                        fontWeight: FontWeightHelper.bold,
                        color: Colors.black,
                      ),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
