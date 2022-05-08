import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toplive/app/modules/room/views/widgets/room_appbar.dart';
import 'package:toplive/app/modules/room/views/widgets/room_chat_bat.dart';
import 'package:toplive/app/modules/room/views/widgets/room_messages.dart';
import 'package:toplive/app/modules/room/views/widgets/room_user.dart';
import 'package:toplive/core/resourses/assets.dart';
import 'package:toplive/core/resourses/values_manger.dart';
import '../controllers/room_controller.dart';

class RoomView extends StatefulWidget {
  @override
  State<RoomView> createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  RoomController controller = Get.put(RoomController());

  @override
  void initState() {
    super.initState();
    print(Get.arguments);
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.assetsImagesRoomBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RoomAppBar(),
                      RoomUsers(),
                      RoomMessages(),
                      ChatBar()
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: context.height / 4,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.2),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(AppSize.size12),
                      topRight: Radius.circular(AppSize.size12),
                    )),
                child: Column(
                  children: [
                    IconButton(
                      icon: Image.asset(Assets.assetsImagesSendMessage),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
