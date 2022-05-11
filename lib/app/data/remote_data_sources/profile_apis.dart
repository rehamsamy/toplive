import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:toplive/app/data/models/user_model.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:toplive/core/constants/app_const.dart';

class ProfileApis {
  Future<UserModel?> getUserProfile() async {
    Dio dio = Dio();
    dio.interceptors
      ..add(DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
      ..add(dioLoggerInterceptor);
    try {
      final response = await dio.get(baseUrl + "profile",
          options: Options(headers: getRequestHeaders()));
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network erorr", e.message.toString());
      return null;
    }
  }

  Future updateProfile({
    required String name,
    required String email,
    required String gender,
    required int countryId,
    required DateTime birthDate,
    required File profileImage,
    String? status,
  }) async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(baseUrl + "profile/update",
          options: Options(headers: getRequestHeaders()),
          data: {
            'name': name,
            'email': email,
            'birth_date': birthDate,
            'gender': gender,
            'profile_status': status,
            'country': countryId,
            'image': File
          });

      return response.data;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }
}
