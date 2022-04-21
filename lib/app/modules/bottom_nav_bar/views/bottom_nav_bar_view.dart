import 'package:ease/widgets/bottom_nav_bar.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toplive/app/modules/home/views/home_view.dart';
import 'package:toplive/core/resourses/color_manger.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
      init: BottomNavBarController(),
      builder: (BottomNavBarController controller) {
        return Scaffold(
          body: controller.CurrentScreen,
          bottomNavigationBar: _bottomNavigationBar(controller),
        );
      },
    );
  }
}

_bottomNavigationBar(BottomNavBarController controller) {
  return Obx(
    () => FlashyTabBar(
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 250),
        selectedIndex: controller.navIndex.value,
        items: [
          FlashyTabBarItem(
              inactiveColor: ColorsManger.primary.withOpacity(.6),
              activeColor: ColorsManger.primary,
              icon: Icon(
                Icons.explore_outlined,
                //  color: Colors.green,
              ),
              title: Text(
                "Explore",
              )),
          FlashyTabBarItem(
              inactiveColor: ColorsManger.primary.withOpacity(.6),
              activeColor: ColorsManger.primary,
              icon: Icon(
                Icons.message,
              ),
              title: Text(
                "Add Room",
              )),
          FlashyTabBarItem(
              inactiveColor: ColorsManger.primary.withOpacity(.6),
              activeColor: ColorsManger.primary,
              icon: Icon(
                Icons.person_pin_circle,
              ),
              title: Text(
                "Profile",
              )),
        ],
        onItemSelected: (index) {
          controller.onSelected(index);
        }),
  );
}
