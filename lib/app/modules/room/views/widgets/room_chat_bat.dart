import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resourses/assets.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../../core/resourses/values_manger.dart';
import '../../../../../core/services/chat/room_chat.dart';
import '../../../home/controllers/home_controller.dart';
import '../../controllers/room_controller.dart';

class ChatBar extends GetWidget<RoomController> {
  const ChatBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.size20 * 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          IconButton(
            icon: Image.asset(Assets.assetsImagesGiftbox),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(Assets.assetsImagesUploadImg),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(Assets.assetsImagesSendMessage),
            onPressed: () {
              RoomChatService().sendMessage(
                  roomId: controller.room.id.toString(),
                  chatMessage: controller.message.text,
                  currentUserId: user!.data!.id.toString(),
                  userName: user?.data?.name.toString(),
                  userImage: user?.data?.image.toString());
              Future.delayed(Duration(milliseconds: 500), () {
                controller.scrollDownAndClearTextField();
              });
            },
          ),
          Expanded(
              child: TextFormField(
            controller: controller.message,
            textInputAction: TextInputAction.send,
            decoration: InputDecoration(
                fillColor: Colors.white12,
                hintText: "message",
                hintStyle: getLightTextStyle(color: Colors.white70)),
          )),
          IconButton(
            icon: Icon(
              Icons.mic,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.speaker,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
