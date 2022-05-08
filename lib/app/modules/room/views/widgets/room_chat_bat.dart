import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toplive/core/services/agora_room_service.dart';

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
            onPressed: () async {
              XFile? pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                controller.imageMessage = File(pickedFile.path);
                RoomChatService().sendMessage(
                    roomId: controller.room.id.toString(),
                    chatMessage: controller.message.text,
                    image: controller.imageMessage,
                    fileName: user!.data!.name.toString() +
                        user!.data!.userId.toString() +
                        controller.imageMessage!.path.split('/').last,
                    currentUserId: user!.data!.id.toString(),
                    userName: user?.data?.name.toString(),
                    userImage: user?.data?.image.toString());
                Future.delayed(Duration(milliseconds: 700), () {
                  controller.scrollDownAndClearTextField();
                });
              }
            },
          ),
          Expanded(
              child: TextFormField(
            controller: controller.message,
            textInputAction: TextInputAction.send,
            autocorrect: true,
            enableSuggestions: true,
            onFieldSubmitted: (value) {
              RoomChatService().sendMessage(
                  roomId: controller.room.id.toString(),
                  chatMessage: controller.message.text,
                  currentUserId: user!.data!.id.toString(),
                  userName: user?.data?.name.toString(),
                  userImage: user?.data?.image.toString());
              Future.delayed(Duration(milliseconds: 700), () {
                controller.scrollDownAndClearTextField();
              });
            },
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
            onPressed: () => RoomService().muteAudioSwitcher(),
          ),
          IconButton(
            icon: Icon(
              Icons.speaker,
              color: Colors.white,
            ),
            onPressed: () => RoomService().speakerAudioSwitcher(),
          ),
        ]),
      ),
    );
  }
}
