import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/user_login_model.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';

import '../../../core/constants/app_const.dart';

class AuthApis {
  Future<void> getOTP(String country, String phoneNumber) async {
    Dio dio = Dio();
    dio.interceptors
      ..add(DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
      ..add(dioLoggerInterceptor);
    try {
      final response = await dio.post(
        baseUrl + "login",
        options: Options(headers: getRequestHeaders(token: "")),
        data: {'country': country, 'phone': phoneNumber},
      );

      return response.data;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return;
    }
  }

  Future<UserLoginModel?> sendOTP() async {
    Dio dio = Dio();
    dio.interceptors
      ..add(DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
      ..add(dioLoggerInterceptor);
    try {
      final response = await dio.post(
        baseUrl + "user_otp",
        options: Options(headers: getRequestHeaders(token: "")),
        data: {'otp': 0000},
      );
      final paresd = UserLoginModel.fromJson(response.data);
      prefs.setString(
          "token", paresd.data?.accessToken.toString() ?? "no token");

      return paresd;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }
}
