import 'package:ease/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toplive/app/modules/home/views/home_view.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
      builder: (controller) => Scaffold(
          body: controller.CurrentScreen ?? HomeView(),
          bottomNavigationBar: EaseNavBar(
              backgroundColor: Colors.white,
              selectedIndex: controller.navIndex ?? 0,
              items: [
                EaseNavBarItem(
                    icon: Icon(
                      Icons.menu, //  color: Colors.green,
                    ),
                    title: Text("Home".tr)),
                EaseNavBarItem(
                    icon: Icon(
                      Icons.create, //  color: Colors.green,
                    ),
                    title: Text("Profile".tr)),
                EaseNavBarItem(
                    icon: Icon(
                      Icons.explore_outlined, //  color: Colors.green,
                    ),
                    title: Text("Profile".tr)),
              ],
              onItemSelected: (index) {
                controller.onSelected(index);
              })),
    );
  }
}
