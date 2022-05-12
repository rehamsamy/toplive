import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ease/ease.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/chat_message_firebase_model.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';
import 'package:toplive/app/modules/profile/views/widgets/dropdown.dart';
import 'package:toplive/app/modules/room/views/widgets/room_appbar_settings_button.dart';
import 'package:toplive/app/routes/app_pages.dart';
import 'package:toplive/core/resourses/font_manger.dart';
import 'package:toplive/core/services/chat/room_chat.dart';

import '../../../../../core/resourses/assets.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../../core/resourses/values_manger.dart';
import '../../controllers/room_controller.dart';

class RoomAppBar extends GetWidget<RoomController> {
  RoomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      child: Column(
        children: [
          const SizedBox(
            height: AppSize.size8,
          ),
          Row(
            children: [
              const SizedBox(
                width: AppSize.size12,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(HeroDialogRoute(
                      builder: (context) => BackButtonDialog()));
                },
                child: Hero(
                  tag: 'room_appbar_back',
                  child: Image.asset(
                    Assets.assetsImagesLogout,
                    width: 30,
                  ),
                ),
              ),
              RoomActions(),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                ),
                child: Row(children: [
                  controller.isRoomJoined
                      ? const SizedBox(
                          width: 20,
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.add_circle_rounded,
                            color: ColorsManger.grey1,
                          ),
                          onPressed: () {
                            RoomChatService().addUser(
                                roomId: controller.room.id.toString(),
                                user: FirebaseChatUser(
                                    id: user?.data?.userId.toString() ?? "",
                                    image: user?.data?.image.toString() ?? "",
                                    isHere: true,
                                    isSpeaker: false,
                                    isKicked: false,
                                    isblocked: false,
                                    name: user?.data?.name.toString() ?? "",
                                    role: "admin",
                                    lastActiveAt: DateTime.now()));
                            Get.snackbar("Joined", "You are now a room member",
                                colorText: ColorsManger.grey2);
                          },
                        ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.room.roomName.toString(),
                        style: getMediumTextStyle(color: ColorsManger.grey1),
                      ),
                      SelectableText("ID: " + controller.room.id.toString(),
                          style: getMediumTextStyle(color: ColorsManger.grey1))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Image.network(
                        controller.room.roomImage.toString(),
                        width: 50,
                        errorBuilder: (context, url, error) {
                          return Icon(Icons.error);
                        },
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class BackButtonDialog extends StatefulWidget {
  BackButtonDialog({Key? key}) : super(key: key);

  @override
  State<BackButtonDialog> createState() => _BackButtonDialogState();
}

class _BackButtonDialogState extends State<BackButtonDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'room_appbar_back',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding20),
          child: Material(
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.size12)),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<RoomController>(
                    init: RoomController(),
                    initState: (_) {},
                    builder: (RoomController controller) {
                      return GestureDetector(
                          onTap: () {
                            RoomChatService().updateUser(
                                roomId: controller.room.id.toString(),
                                user: FirebaseChatUser(
                                    id: user?.data?.id.toString() ?? "",
                                    isHere: false,
                                    lastActiveAt: DateTime.now()));
                            controller.engine.leaveChannel();
                            controller.engine.destroy();
                            Get.offAndToNamed(Routes.BOTTOM_NAV_BAR);
                          },
                          child: Column(
                            children: [
                              Image.asset(Assets.assetsImagesExitRoom,
                                  height: context.height * .2),
                              const SizedBox(
                                height: AppSize.size12,
                              ),
                              Text(
                                "Exit Room",
                                style: getBoldTextStyle(
                                    color: ColorsManger.white,
                                    fontSize: FontSize.xxlarge),
                              )
                            ],
                          ));
                    },
                  ),
                  const SizedBox(
                    height: AppSize.size12 * 4,
                  ),
                  GetBuilder<RoomController>(
                    init: RoomController(),
                    initState: (_) {},
                    builder: (RoomController controller) {
                      return GestureDetector(
                          onTap: () {
                            Get.offAndToNamed(Routes.BOTTOM_NAV_BAR);
                          },
                          child: Column(
                            children: [
                              Image.asset(Assets.assetsImagesKeepRoom,
                                  height: context.height * .2),
                              const SizedBox(
                                height: AppSize.size12,
                              ),
                              Text(
                                "Keep Room",
                                style: getBoldTextStyle(
                                    color: ColorsManger.white,
                                    fontSize: FontSize.xxlarge),
                              )
                            ],
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
