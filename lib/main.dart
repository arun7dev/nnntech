import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';

import 'Screens/landing.dart';

void main() {
  // ResponsiveSizingConfig.instance.setCustomBreakpoints(
  //   ScreenBreakpoints(desktop: 800, tablet: 700, watch: 200),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner:   false,
        title: '',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  Home(),
      );
    });
  }
}



