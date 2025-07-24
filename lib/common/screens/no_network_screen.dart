import 'package:flutter/material.dart';

class  NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child:Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/core/no_network.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ) ,
  );
  }
}