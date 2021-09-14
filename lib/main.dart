import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constants/app_theme.dart';
import 'core/utils/langue.dart';
import 'core/utils/routes.dart';
import 'ui/homeScreen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'appTitle'.tr,
      translations: Langue(),
      locale: Locale('en', 'US'), //Localizations.localeOf(context),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: HomeScreen.routeName,
      // defaultTransition: Transition.fadeIn,
      getPages: routes,
      theme: AppTheme.defTheme,
    );
  }
}
