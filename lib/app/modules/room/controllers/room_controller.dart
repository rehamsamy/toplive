import 'package:get/get.dart';
import 'package:toplive/app/data/models/room_model.dart';
import 'package:toplive/core/services/agora_room_service.dart';

class RoomController extends GetxController {
  late RoomModel room = RoomModel.fromJson(Get.arguments);
  int? remoteUid;
  void init() async {
    print('onInit');

    //print("Room ID :" + room.id.toString());
    remoteUid = await RoomService().initAgora(channelName: room.id.toString());
    print("agora_started");
  }
}
