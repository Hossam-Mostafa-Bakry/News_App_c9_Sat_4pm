import 'package:flutter/material.dart';
import 'package:news_app_c9_sat_4pm/core/theme/app_theme.dart';
import 'package:news_app_c9_sat_4pm/pages/home/home_view.dart';
import 'package:news_app_c9_sat_4pm/pages/settings/settings_view.dart';
import 'package:news_app_c9_sat_4pm/pages/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeView.routeName: (context) => HomeView(),
        SettingsView.routeName: (context) => const SettingsView()
      },
    );
  }
}
