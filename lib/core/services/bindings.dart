import 'package:get/get.dart';
import 'package:toplive/app/modules/auth/controllers/auth_controller.dart';
import 'package:toplive/app/modules/chat/controllers/chat_controller.dart';
import 'package:toplive/app/modules/events/controllers/events_controller.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';
import 'package:toplive/app/modules/profile/controllers/profile_controller.dart';
import 'package:toplive/app/modules/room/controllers/room_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
    );
    Get.lazyPut(
      () => AuthController(),
    );
    Get.lazyPut(
      () => ChatController(),
    );
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(
      () => EventsController(),
    );
    Get.lazyPut(
      () => RoomController(),
    );
  }
}
