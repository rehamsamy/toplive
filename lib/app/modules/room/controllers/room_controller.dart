import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:toplive/app/data/models/room_model.dart';
import 'package:toplive/core/services/agora_room_service.dart';
import 'package:flutter/material.dart';

class RoomController extends GetxController {
  ScrollController scrollController = ScrollController();
  File? imageMessage;
  void scrollDownAndClearTextField() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
    message.clear();
  }

  late RoomModel room = RoomModel.fromJson(Get.arguments);
  TextEditingController message = TextEditingController();
  int? remoteUid;

  void init() async {
    super.onInit();
    print('onInit');

    //print("Room ID :" + room.id.toString());
    remoteUid = await RoomService().initAgora(channelName: room.id.toString());
    print("agora_started");
    Future.delayed(Duration(seconds: 1), () {
      scrollDownAndClearTextField();
    });
  }
}
