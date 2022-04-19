import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import 'package:flutter/material.dart';
class BottomNavBarController extends GetxController {
  RxDouble height = 1.0.obs;
  Widget _currentScreen = HomeView();
  RxBool floor = false.obs; //*(False = 1) And(True for 2)

  get CurrentScreen => _currentScreen;

  int _navIndex = 0;
  get navIndex => _navIndex;
  onSelected(int index) {
    _navIndex = index;
    switch (index) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = ProfileView();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileView();
          break;
        }

    }
    update();
  }
}
