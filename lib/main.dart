import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:toplive/app/data/remote_data_sources/profile_apis.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';
import 'package:toplive/app/modules/others/check_if_signed_and_navigate.dart';
import 'package:toplive/app/modules/others/error_screen.dart';
import 'package:toplive/core/services/bindings.dart';
import 'package:toplive/core/services/chat/chat_service.dart';
import 'package:toplive/core/services/theme.dart';
import 'package:toplive/core/services/translations_service.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  StreamChatClient client = ChatService.instance.chatClient;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  user = await ProfileApis().getUserProfile();
  print(user);
  var channel = ChatService.instance.chatClient.channel(
    "messaging",
    id: "toplive",
  );
  client.connectUser(
      User(
        id: user?.data?.id.toString() ?? "Top Live",
        name: user?.data?.name,
        image: user?.data?.image,
      ),
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiRGVtbyBVc2VyIn0.VaS_AXBf1xRTQoLrZno6AuwHsfgbRIYDPcQn5rRN36E");
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://5dbefdc1330e483faccd857d1dca6968@o1189629.ingest.sentry.io/6310435';
    },
    // Init your App.
    appRunner: () => runApp(MyApp(
      channel: channel,
    )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.channel}) : super(key: key);
  final Channel channel;

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
        return StreamChannel(
          child: widget!,
          channel: channel,
          showLoading: false,
        );
      },
    );
  }
}
