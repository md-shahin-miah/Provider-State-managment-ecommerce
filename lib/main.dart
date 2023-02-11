import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:provider_example/src/business_logic/provider/bag_provider.dart';
import 'package:provider_example/src/data/repository/repository.dart';
import 'package:provider_example/src/presentation/screen/intro_screen.dart';

import 'core/app_theme.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Enable horizontal scroll on flutter web
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      home: MultiProvider(
        providers: [
          Provider<Repository>(create: (context) => Repository()),
          ChangeNotifierProvider<BagProvider>(
            create: (context) => BagProvider(
              repository: context.read<Repository>(),
            ),
          )
        ],
        child: const IntroScreen(),
      ),

      theme: AppTheme.lightTheme,
    );
  }
}
