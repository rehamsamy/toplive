import 'package:get/get.dart';
import 'package:toplive/app/modules/chat/views/chat_view.dart';

import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import 'package:flutter/material.dart';

class BottomNavBarController extends GetxController {
  RxDouble height = 1.0.obs;
  Widget _currentScreen = HomeView();
  RxBool floor = false.obs; //*(False = 1) And(True for 2)

  get CurrentScreen => _currentScreen;

  final RxInt _navIndex = 0.obs;

  get navIndex => _navIndex;
  onSelected(int index) {
    _navIndex.value = index;
    switch (index) {
      case 0:
        {
          _currentScreen = HomeView();

          break;
        }

      case 1:
        {
          _currentScreen = ChatView();
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
