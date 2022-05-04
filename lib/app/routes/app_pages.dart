// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import 'package:toplive/app/modules/auth/views/auth_view.dart';
import 'package:toplive/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:toplive/app/modules/chat/views/chat_view.dart';
import 'package:toplive/app/modules/events/views/events_view.dart';
import 'package:toplive/app/modules/home/views/home_view.dart';
import 'package:toplive/app/modules/profile/views/profile_view.dart';
import 'package:toplive/app/modules/room/views/room_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
    ),
    GetPage(
      name: _Paths.ROOM,
      page: () => RoomView(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => BottomNavBarView(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
    ),
    GetPage(
      name: _Paths.EVENTS,
      page: () => EventsView(),
    ),
  ];
}
