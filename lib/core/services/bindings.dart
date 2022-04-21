import 'package:get/get.dart';
import 'package:toplive/app/modules/auth/controllers/auth_controller.dart';
import 'package:toplive/app/modules/chat/controllers/chat_controller.dart';
import 'package:toplive/app/modules/events/controllers/events_controller.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';
import 'package:toplive/app/modules/profile/controllers/profile_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => EventsController(), fenix: true);
  }
}
