import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:toplive/app/modules/chat/views/chat_history.dart';
import 'package:toplive/app/modules/chat/views/chat_view.dart';
import 'package:toplive/app/modules/events/views/events_view.dart';
import 'package:toplive/app/modules/friends/views/friends_view.dart';
import 'package:toplive/core/resourses/assets.dart';
import 'package:toplive/core/resourses/color_manger.dart';

import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNavBarController extends GetxController {
  RxDouble height = 1.0.obs;
  // ignore: prefer_final_fields
  Widget _currentScreen = HomeView();
  PersistentTabController navController =
      PersistentTabController(initialIndex: 0);

  get currentScreen => _currentScreen;

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          Assets.assetsImagesGroup,
        ),
        title: ("Rooms"),
        activeColorPrimary: ColorsManger.primary,
        inactiveColorPrimary: ColorsManger.primary,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          Assets.assetsImagesFriends,
        ),
        title: ("friends"),
        activeColorPrimary: ColorsManger.primary,
        inactiveColorPrimary: ColorsManger.primary,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          Assets.assetsImagesChats,
        ),
        title: ("chat"),
        activeColorPrimary: ColorsManger.primary,
        inactiveColorPrimary: ColorsManger.primary,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          Assets.assetsImagesEvents,
        ),
        title: ("events"),
        activeColorPrimary: ColorsManger.primary,
        inactiveColorPrimary: ColorsManger.primary,
      ),
    ];
  }

  List<Widget> buildScreens() {
    return [
      HomeView(),
      FriendsView(),
      ChatHistory(
        myId: user?.data?.id.toString() ?? "",
      ),
      EventsView(),
    ];
  }
}
