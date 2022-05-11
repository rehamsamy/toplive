import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/blocked_users.dart';
import 'package:toplive/core/constants/app_const.dart';

class BlockUserApis {
  Future<BlockedUsersModel?> getBlockedUsers() async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(baseUrl + "block_list",
          options: Options(headers: getRequestHeaders()));

      return BlockedUsersModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future blockUser({required int userId}) async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(baseUrl + "block_user",
          options: Options(headers: getRequestHeaders()),
          data: {"user": userId});

      return response.data;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future unblockUser({required int userId}) async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(baseUrl + "unblock_user",
          options: Options(headers: getRequestHeaders()),
          data: {"user": userId});

      return response.data;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network erorr", e.message.toString());
      return null;
    }
  }
}
