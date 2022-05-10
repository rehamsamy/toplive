import 'dart:async';
import 'dart:io';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/room_model.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';
import 'package:toplive/core/services/agora_room_service.dart';
import 'package:flutter/material.dart';
import 'package:toplive/core/services/chat/room_chat.dart';

class RoomController extends GetxController {
  ScrollController scrollController = ScrollController();
  late RoomModel room = RoomModel.fromJson(Get.arguments);
  TextEditingController message = TextEditingController();
  late RtcEngine engine;
  int? remoteUid;
  bool isRoomOwner = false;
  bool isRoomMember = false;
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
    engine = await RtcEngine.create("900170190e1c44028e728d407abf54a0");

    RoomChatService().getFlyingStream(room.id.toString(), 2, Get.context!);
    isRoomOwner = room.id.toString() == user?.data?.id.toString();
    /*RoomChatService().addOrUpdateUser(
        roomId: room.id.toString(),
        user: FirebaseChatUser(
            id: user?.data?.id.toString() ?? "",
            lastActiveAt: DateTime.now(),
            isblocked: false,
            role: "visitor",
            image: user?.data?.image.toString() ?? "",
            isHere: true,
            name: user?.data?.name.toString() ?? ""));
    users = RoomChatService().getChatUsersStream(
        room.id.toString(), room.microphones!.toInt(), Get.context!);
    room.user?.id.toString() == user?.data?.id.toString();
*/
    print('onInit');
    //print("Room ID :" + room.id.toString());
    await RoomService()
        .initAgora(channelName: room.id.toString(), role: ClientRole.Audience)
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
