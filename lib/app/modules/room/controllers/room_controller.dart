import 'dart:async';
import 'dart:io';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/room_model.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';
import 'package:toplive/core/services/chat/agora_room_service.dart';
import 'package:flutter/material.dart';
import 'package:toplive/core/services/chat/room_chat.dart';

import '../../../data/models/chat_message_firebase_model.dart';

class RoomController extends GetxController {
  ScrollController scrollController = ScrollController();
  late RoomModel room = RoomModel.fromJson(Get.arguments);
  TextEditingController message = TextEditingController();
  late RtcEngine engine;
  int? remoteUid;
  bool isRoomOwner = false;
  bool isRoomJoined = false;
  bool isRoomSpeakerPermissionAllowed = false;
  bool isRoomSpeaker = false;

  List speakers = [];

  File? imageMessage;
  Stream<QuerySnapshot<Object?>>? users;
  //////////////////////////////////////////////////////////////////////////////
  ///#                                                                      ///
  //*                        ***@abdelrahmanelmarakby***                  ///
  //!                       ***@abdelrahmanelmarakby***                 ///
  //*                        ***@abdelrahmanelmarakby***                 ///
  //#                                                                       ///
  //#///////////////////////////////////////////////////////////////////////////
  void scrollDownAndClearTextField() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 200),
    );
    message.clear();
  }

  void init() async {
    super.onInit();
    RoomChatService().addUser(
        roomId: room.id.toString(),
        user: FirebaseChatUser(
            id: user?.data?.userId.toString() ?? "",
            lastActiveAt: DateTime.now(),
            image: user?.data?.image.toString() ?? "",
            isKicked: false,
            isSpeaker: false,
            isblocked: false,
            role: "member",
            isHere: true,
            name: user?.data?.name.toString() ?? ""));
    engine = await RtcEngine.create("900170190e1c44028e728d407abf54a0");

    //RoomChatService().getFlyingStream(room.id.toString(), 2, Get.context!);
    isRoomOwner = room.user?.id.toString() == user?.data?.id.toString();

    users = RoomChatService().getChatUsersStream(
        room.id.toString(), room.microphones!.toInt(), Get.context!);
    room.user?.id.toString() == user?.data?.id.toString();

    print('onInit');
    //print("Room ID :" + room.id.toString());
    await RoomService()
        .initAgora(
            channelName: room.id.toString(), role: ClientRole.Broadcaster)
        .then((value) {
      remoteUid = value[0];
      engine = value[1];
    });
    print("agora_started");

    Future.delayed(Duration(seconds: 1), () {
      scrollDownAndClearTextField();
    });
  }
}
