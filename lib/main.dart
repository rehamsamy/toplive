import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:toplive/app/modules/others/check_if_signed_and_navigate.dart';
import 'package:toplive/app/modules/others/error_screen.dart';
import 'package:toplive/core/services/bindings.dart';
import 'package:toplive/core/services/theme.dart';
import 'package:toplive/core/services/translations_service.dart';
import 'app/routes/app_pages.dart';

import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://5dbefdc1330e483faccd857d1dca6968@o1189629.ingest.sentry.io/6310435';
    },
    // Init your App.
    appRunner: () => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //channel.watch();
    return GetMaterialApp(
      title: "Top live",
      home: CheckSigningIn(),
      getPages: AppPages.routes,
      initialBinding: Binding(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      defaultTransition: Transition.fadeIn,
      debugShowCheckedModeBanner: false,
      translations: TranslationsService(), // your translations
      locale: Locale("en"), // translations will be displayed in that locale
      fallbackLocale: Locale("en"),

      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError(errorDetails: errorDetails);
        };
        ResponsiveWrapper(
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          child: widget,
        );
        return widget!;
      },
    );
  }
}
