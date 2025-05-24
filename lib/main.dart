import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants.dart';
import 'screens/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Portfolio Student',
            theme: ThemeData(
              fontFamily: kFontFamily,
              scaffoldBackgroundColor: kBackground,
              colorScheme: ColorScheme.fromSeed(seedColor: kOrange),
            ),
            home: const MainNavigationScreen(),
          ),
    );
  }
}
