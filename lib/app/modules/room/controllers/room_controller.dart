import 'package:get/get.dart';
import 'package:toplive/core/services/agora_room_service.dart';

class RoomController extends GetxController {
  int? remoteUid;
  @override
  void onInit() async {
    print('onInit');
    remoteUid = await RoomService().initAgora();
    print("agora_started");
    super.onInit();
  }
}
