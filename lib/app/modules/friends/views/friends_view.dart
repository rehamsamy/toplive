import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toplive/core/constants/app_const.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/font_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';

import '../../../../core/resourses/assets.dart';
import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManger.white,
        title: Text(
          'Friends',
          style: getBoldTextStyle(
            color: ColorsManger.primary,
            fontSize: FontSize.xlarge,
          ),
        ),
      ),
      body: Container(
        height: context.height,
        width: context.width,
        decoration: backgroundBoxDectoration,
        child: Text(
          'FriendsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
