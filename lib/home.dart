import 'package:flutter/material.dart';
import 'package:pizza_app/common/screens/no_network_screen.dart';
import 'package:pizza_app/core/app/connectivity_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityController.instance.connection,
      builder: (context, isConnected, child) {
        if (isConnected) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Store App', style: TextStyle(fontSize: 24)),
              ),
              body: Builder(
                builder: (context) {
                  ConnectivityController.instance.init();
                  return const Center(
                    child: Text('', style: TextStyle(fontSize: 20)),
                  );
                },
              ),
            ),
          );
        } else {
          return const MaterialApp(home: NoNetworkScreen());
        }
      },
    );
  }
}
