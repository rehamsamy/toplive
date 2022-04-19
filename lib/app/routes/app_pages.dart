import 'package:get/get.dart';

import 'package:toplive/app/modules/auth/bindings/auth_binding.dart';
import 'package:toplive/app/modules/auth/views/auth_view.dart';
import 'package:toplive/app/modules/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import 'package:toplive/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:toplive/app/modules/home/bindings/home_binding.dart';
import 'package:toplive/app/modules/home/views/home_view.dart';
import 'package:toplive/app/modules/profile/bindings/profile_binding.dart';
import 'package:toplive/app/modules/profile/views/profile_view.dart';
import 'package:toplive/app/modules/room/bindings/room_binding.dart';
import 'package:toplive/app/modules/room/views/room_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ROOM,
      page: () => RoomView(),
      binding: RoomBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
  ];
}
