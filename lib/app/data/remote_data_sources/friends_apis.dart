import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/friend_requests.dart';
import 'package:toplive/app/data/models/friends_list.dart';

import '../../../core/constants/app_const.dart';

class FriendsApis {
  Future<FriendsListModel?> friendsList() async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(
        baseUrl + "friends_list",
        options: Options(headers: getRequestHeaders()),
      );
      return FriendsListModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future<FriendRequestsModel?> friendRequests() async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(
        baseUrl + "friend_requests",
        options: Options(headers: getRequestHeaders()),
      );

      return FriendRequestsModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future acceptFriend(int id) async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(
        baseUrl + "accept_friend_request",
        options: Options(headers: getRequestHeaders()),
        data: {"id": id},
      );

      return response.data;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future deleteFriendRequest(int id) async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(
        baseUrl + "delete_friend_request",
        options: Options(headers: getRequestHeaders()),
        data: {"id": id},
      );

      return response.data;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future sendFriendRequest(int id) async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(
        baseUrl + "send_friend_request",
        options: Options(headers: getRequestHeaders()),
        data: {"user": id},
      );
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future<FriendRequestsModel?> searchForFriends(int id) async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(
        baseUrl + "search_new_friend",
        options: Options(headers: getRequestHeaders()),
        data: {"user_id": id},
      );

      return FriendRequestsModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }
}
