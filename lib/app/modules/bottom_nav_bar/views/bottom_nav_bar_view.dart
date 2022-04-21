import 'package:ease/widgets/bottom_nav_bar.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:toplive/app/modules/home/views/home_view.dart';
import 'package:toplive/core/resourses/color_manger.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
      init: BottomNavBarController(),
      builder: (BottomNavBarController controller) {
        return SafeArea(
          child: Scaffold(
            body: controller.currentScreen,
            bottomNavigationBar: _bottomNavigationBar(controller, context),
          ),
        );
      },
    );
  }
}

_bottomNavigationBar(BottomNavBarController controller, BuildContext context) {
  return PersistentTabView(
    context,
    controller: controller.navController,
    screens: controller.buildScreens(),
    items: controller.navBarsItems(),
    confineInSafeArea: true,

    backgroundColor: Colors.white, // Default is Colors.white.
    handleAndroidBackButtonPress: true, // Default is true.
    resizeToAvoidBottomInset:
        true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
    stateManagement: true, // Default is true.
    hideNavigationBarWhenKeyboardShows:
        true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
    decoration: NavBarDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          spreadRadius: 0.0,
          offset: Offset(
            0.0, // horizontal, move right 10
            -5, // vertical, move down 10
          ),
        ),
      ],
      borderRadius: BorderRadius.circular(10.0),
      colorBehindNavBar: Colors.white,
    ),
    popAllScreensOnTapOfSelectedTab: true,

    popActionScreens: PopActionScreensType.all,
    itemAnimationProperties: ItemAnimationProperties(
      // Navigation Bar's items animation properties.
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    ),

    screenTransitionAnimation: ScreenTransitionAnimation(
      // Screen transition animation on change of selected tab.
      animateTabTransition: true,
      curve: Curves.ease,
      duration: Duration(milliseconds: 200),
    ),
    navBarStyle:
        NavBarStyle.style14, // Choose the nav bar style with this property.
  );
}
