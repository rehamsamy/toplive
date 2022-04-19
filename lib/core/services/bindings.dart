import 'package:get/get.dart';
import 'package:toplive/app/modules/auth/controllers/auth_controller.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
