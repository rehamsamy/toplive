import 'dart:async';
import 'dart:io';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:toplive/app/data/models/room_model.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';
import 'package:toplive/core/services/agora_room_service.dart';
import 'package:flutter/material.dart';
import 'package:toplive/core/services/chat/room_chat.dart';

class RoomController extends GetxController {
  ScrollController scrollController = ScrollController();

  File? imageMessage;
  Stream<QuerySnapshot<Object?>>? users;
  void scrollDownAndClearTextField() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 200),
    );
    message.clear();
  }

  late RoomModel room = RoomModel.fromJson(Get.arguments);
  TextEditingController message = TextEditingController();
  int? remoteUid;

  void init() async {
    super.onInit();
    RoomChatService().getFlyingStream(room.id.toString(), 2, Get.context!);
    RoomChatService().getChatUsersStream(room.id.toString(), 2, Get.context!);
    users = RoomChatService().getChatUsersStream(
        room.id.toString(), room.microphones!.toInt(), Get.context!);
    print('onInit');
    //print("Room ID :" + room.id.toString());
    /* remoteUid = await RoomService().initAgora(
        channelName: room.id.toString(),
        role: room.user?.id == user?.data?.id
            ? ClientRole.Broadcaster
            : ClientRole.Audience);*/

    print("agora_started");
    Future.delayed(Duration(seconds: 1), () {
      scrollDownAndClearTextField();
    });
  }
}
