import 'package:get/get.dart';
import 'package:toplive/app/data/models/user_model.dart';
import 'package:toplive/app/data/remote_data_sources/profile_apis.dart';

UserModel? user;

class HomeController extends GetxController {
  @override
  void onInit() async {
    user = await ProfileApis().getUserProfile();
    super.onInit();
  }
}
