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
        options: Options(
            headers: getRequestHeaders(
                token:
                    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTZjOGRlZDA5NmFkYjNlNjFmNWFiZDhiNjE2MTAzY2UwZGYyN2Q4NjhmYTdkMmFkMTgzNzJkOTg4Yzg0NGJlZGE0MTAzZjYxMjViZTllNDUiLCJpYXQiOjE2NDA3MDQxMTMuNjE2Njg0OTEzNjM1MjUzOTA2MjUsIm5iZiI6MTY0MDcwNDExMy42MTY2ODgwMTMwNzY3ODIyMjY1NjI1LCJleHAiOjE2NzIyNDAxMTMuNjExODAzMDU0ODA5NTcwMzEyNSwic3ViIjoiMjMiLCJzY29wZXMiOltdfQ.dqh9IJST4CWRYs6BHpjMALWhrKzSS-V42WR8OURk96z6mdzcjEoXtEKcOE1Td1LgfE3DwwXi92Cv5GQ39E05SRQQYd8R_fl0_9ccqN1ZZC9cItluYkYqZ5lxqs3HHGCXWEffjm-zyTks87J540G0Kb-rIzYSI6lx8TQl7VCqAEyOTrHwC6fAzdm67dGsSNiNvxdW6a3po9lYDuMFbBRCtWANlQxe_lIcb2qVZA2H10H0SGfwoSDVpYPKpuLvUn68UAlsLrga2oK8GRmag4rZDQj2OPwWKs8AcF1DMfxGZ0u8FEL1CgMnCY2DBqrHa7GuCXsl6Ulrh3e9TM5Yndz90Wvdv7s_46J5pv8Uz6oOya9Dj-qbCnK6GnNTvj__Imyaa72eFG0MVAnAKstGS8W9_gCvhbDO7QFsacGcYdOofkKgJ-2QVFQITZj05a1-p7J3UnD9ETEOTvyqk1mduk8dMBNnR5UvVw-ntsjLgCvbF-Vg9PBkGL4zi641d1Fza9phOvOUUwqT0l6CeXDeBhXCTmfboUR8BjjnHbR8atWJ9wA8dE_6DDYE2bWYx8jWIHXM39BNYzflyYBgGIsUELgk25lG2Ke1tIls_Omtb2mpBOI1-BkTNnnmFEnKPUu_1c0wX5fabFRQUnEngLC9kvSwFZJxsa7yVZWNt3CivSt6Eao")),
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
        options: Options(
            headers: getRequestHeaders(
                token:
                    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTZjOGRlZDA5NmFkYjNlNjFmNWFiZDhiNjE2MTAzY2UwZGYyN2Q4NjhmYTdkMmFkMTgzNzJkOTg4Yzg0NGJlZGE0MTAzZjYxMjViZTllNDUiLCJpYXQiOjE2NDA3MDQxMTMuNjE2Njg0OTEzNjM1MjUzOTA2MjUsIm5iZiI6MTY0MDcwNDExMy42MTY2ODgwMTMwNzY3ODIyMjY1NjI1LCJleHAiOjE2NzIyNDAxMTMuNjExODAzMDU0ODA5NTcwMzEyNSwic3ViIjoiMjMiLCJzY29wZXMiOltdfQ.dqh9IJST4CWRYs6BHpjMALWhrKzSS-V42WR8OURk96z6mdzcjEoXtEKcOE1Td1LgfE3DwwXi92Cv5GQ39E05SRQQYd8R_fl0_9ccqN1ZZC9cItluYkYqZ5lxqs3HHGCXWEffjm-zyTks87J540G0Kb-rIzYSI6lx8TQl7VCqAEyOTrHwC6fAzdm67dGsSNiNvxdW6a3po9lYDuMFbBRCtWANlQxe_lIcb2qVZA2H10H0SGfwoSDVpYPKpuLvUn68UAlsLrga2oK8GRmag4rZDQj2OPwWKs8AcF1DMfxGZ0u8FEL1CgMnCY2DBqrHa7GuCXsl6Ulrh3e9TM5Yndz90Wvdv7s_46J5pv8Uz6oOya9Dj-qbCnK6GnNTvj__Imyaa72eFG0MVAnAKstGS8W9_gCvhbDO7QFsacGcYdOofkKgJ-2QVFQITZj05a1-p7J3UnD9ETEOTvyqk1mduk8dMBNnR5UvVw-ntsjLgCvbF-Vg9PBkGL4zi641d1Fza9phOvOUUwqT0l6CeXDeBhXCTmfboUR8BjjnHbR8atWJ9wA8dE_6DDYE2bWYx8jWIHXM39BNYzflyYBgGIsUELgk25lG2Ke1tIls_Omtb2mpBOI1-BkTNnnmFEnKPUu_1c0wX5fabFRQUnEngLC9kvSwFZJxsa7yVZWNt3CivSt6Eao")),
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
        options: Options(
            headers: getRequestHeaders(
                token:
                    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTZjOGRlZDA5NmFkYjNlNjFmNWFiZDhiNjE2MTAzY2UwZGYyN2Q4NjhmYTdkMmFkMTgzNzJkOTg4Yzg0NGJlZGE0MTAzZjYxMjViZTllNDUiLCJpYXQiOjE2NDA3MDQxMTMuNjE2Njg0OTEzNjM1MjUzOTA2MjUsIm5iZiI6MTY0MDcwNDExMy42MTY2ODgwMTMwNzY3ODIyMjY1NjI1LCJleHAiOjE2NzIyNDAxMTMuNjExODAzMDU0ODA5NTcwMzEyNSwic3ViIjoiMjMiLCJzY29wZXMiOltdfQ.dqh9IJST4CWRYs6BHpjMALWhrKzSS-V42WR8OURk96z6mdzcjEoXtEKcOE1Td1LgfE3DwwXi92Cv5GQ39E05SRQQYd8R_fl0_9ccqN1ZZC9cItluYkYqZ5lxqs3HHGCXWEffjm-zyTks87J540G0Kb-rIzYSI6lx8TQl7VCqAEyOTrHwC6fAzdm67dGsSNiNvxdW6a3po9lYDuMFbBRCtWANlQxe_lIcb2qVZA2H10H0SGfwoSDVpYPKpuLvUn68UAlsLrga2oK8GRmag4rZDQj2OPwWKs8AcF1DMfxGZ0u8FEL1CgMnCY2DBqrHa7GuCXsl6Ulrh3e9TM5Yndz90Wvdv7s_46J5pv8Uz6oOya9Dj-qbCnK6GnNTvj__Imyaa72eFG0MVAnAKstGS8W9_gCvhbDO7QFsacGcYdOofkKgJ-2QVFQITZj05a1-p7J3UnD9ETEOTvyqk1mduk8dMBNnR5UvVw-ntsjLgCvbF-Vg9PBkGL4zi641d1Fza9phOvOUUwqT0l6CeXDeBhXCTmfboUR8BjjnHbR8atWJ9wA8dE_6DDYE2bWYx8jWIHXM39BNYzflyYBgGIsUELgk25lG2Ke1tIls_Omtb2mpBOI1-BkTNnnmFEnKPUu_1c0wX5fabFRQUnEngLC9kvSwFZJxsa7yVZWNt3CivSt6Eao")),
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
        options: Options(
            headers: getRequestHeaders(
                token:
                    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTZjOGRlZDA5NmFkYjNlNjFmNWFiZDhiNjE2MTAzY2UwZGYyN2Q4NjhmYTdkMmFkMTgzNzJkOTg4Yzg0NGJlZGE0MTAzZjYxMjViZTllNDUiLCJpYXQiOjE2NDA3MDQxMTMuNjE2Njg0OTEzNjM1MjUzOTA2MjUsIm5iZiI6MTY0MDcwNDExMy42MTY2ODgwMTMwNzY3ODIyMjY1NjI1LCJleHAiOjE2NzIyNDAxMTMuNjExODAzMDU0ODA5NTcwMzEyNSwic3ViIjoiMjMiLCJzY29wZXMiOltdfQ.dqh9IJST4CWRYs6BHpjMALWhrKzSS-V42WR8OURk96z6mdzcjEoXtEKcOE1Td1LgfE3DwwXi92Cv5GQ39E05SRQQYd8R_fl0_9ccqN1ZZC9cItluYkYqZ5lxqs3HHGCXWEffjm-zyTks87J540G0Kb-rIzYSI6lx8TQl7VCqAEyOTrHwC6fAzdm67dGsSNiNvxdW6a3po9lYDuMFbBRCtWANlQxe_lIcb2qVZA2H10H0SGfwoSDVpYPKpuLvUn68UAlsLrga2oK8GRmag4rZDQj2OPwWKs8AcF1DMfxGZ0u8FEL1CgMnCY2DBqrHa7GuCXsl6Ulrh3e9TM5Yndz90Wvdv7s_46J5pv8Uz6oOya9Dj-qbCnK6GnNTvj__Imyaa72eFG0MVAnAKstGS8W9_gCvhbDO7QFsacGcYdOofkKgJ-2QVFQITZj05a1-p7J3UnD9ETEOTvyqk1mduk8dMBNnR5UvVw-ntsjLgCvbF-Vg9PBkGL4zi641d1Fza9phOvOUUwqT0l6CeXDeBhXCTmfboUR8BjjnHbR8atWJ9wA8dE_6DDYE2bWYx8jWIHXM39BNYzflyYBgGIsUELgk25lG2Ke1tIls_Omtb2mpBOI1-BkTNnnmFEnKPUu_1c0wX5fabFRQUnEngLC9kvSwFZJxsa7yVZWNt3CivSt6Eao")),
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
        options: Options(
            headers: getRequestHeaders(
                token:
                    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTZjOGRlZDA5NmFkYjNlNjFmNWFiZDhiNjE2MTAzY2UwZGYyN2Q4NjhmYTdkMmFkMTgzNzJkOTg4Yzg0NGJlZGE0MTAzZjYxMjViZTllNDUiLCJpYXQiOjE2NDA3MDQxMTMuNjE2Njg0OTEzNjM1MjUzOTA2MjUsIm5iZiI6MTY0MDcwNDExMy42MTY2ODgwMTMwNzY3ODIyMjY1NjI1LCJleHAiOjE2NzIyNDAxMTMuNjExODAzMDU0ODA5NTcwMzEyNSwic3ViIjoiMjMiLCJzY29wZXMiOltdfQ.dqh9IJST4CWRYs6BHpjMALWhrKzSS-V42WR8OURk96z6mdzcjEoXtEKcOE1Td1LgfE3DwwXi92Cv5GQ39E05SRQQYd8R_fl0_9ccqN1ZZC9cItluYkYqZ5lxqs3HHGCXWEffjm-zyTks87J540G0Kb-rIzYSI6lx8TQl7VCqAEyOTrHwC6fAzdm67dGsSNiNvxdW6a3po9lYDuMFbBRCtWANlQxe_lIcb2qVZA2H10H0SGfwoSDVpYPKpuLvUn68UAlsLrga2oK8GRmag4rZDQj2OPwWKs8AcF1DMfxGZ0u8FEL1CgMnCY2DBqrHa7GuCXsl6Ulrh3e9TM5Yndz90Wvdv7s_46J5pv8Uz6oOya9Dj-qbCnK6GnNTvj__Imyaa72eFG0MVAnAKstGS8W9_gCvhbDO7QFsacGcYdOofkKgJ-2QVFQITZj05a1-p7J3UnD9ETEOTvyqk1mduk8dMBNnR5UvVw-ntsjLgCvbF-Vg9PBkGL4zi641d1Fza9phOvOUUwqT0l6CeXDeBhXCTmfboUR8BjjnHbR8atWJ9wA8dE_6DDYE2bWYx8jWIHXM39BNYzflyYBgGIsUELgk25lG2Ke1tIls_Omtb2mpBOI1-BkTNnnmFEnKPUu_1c0wX5fabFRQUnEngLC9kvSwFZJxsa7yVZWNt3CivSt6Eao")),
        data: {"user": id},
      );
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future searchForFriends(int id) async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(
        baseUrl + "search_new_friend",
        options: Options(
            headers: getRequestHeaders(
                token:
                    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTZjOGRlZDA5NmFkYjNlNjFmNWFiZDhiNjE2MTAzY2UwZGYyN2Q4NjhmYTdkMmFkMTgzNzJkOTg4Yzg0NGJlZGE0MTAzZjYxMjViZTllNDUiLCJpYXQiOjE2NDA3MDQxMTMuNjE2Njg0OTEzNjM1MjUzOTA2MjUsIm5iZiI6MTY0MDcwNDExMy42MTY2ODgwMTMwNzY3ODIyMjY1NjI1LCJleHAiOjE2NzIyNDAxMTMuNjExODAzMDU0ODA5NTcwMzEyNSwic3ViIjoiMjMiLCJzY29wZXMiOltdfQ.dqh9IJST4CWRYs6BHpjMALWhrKzSS-V42WR8OURk96z6mdzcjEoXtEKcOE1Td1LgfE3DwwXi92Cv5GQ39E05SRQQYd8R_fl0_9ccqN1ZZC9cItluYkYqZ5lxqs3HHGCXWEffjm-zyTks87J540G0Kb-rIzYSI6lx8TQl7VCqAEyOTrHwC6fAzdm67dGsSNiNvxdW6a3po9lYDuMFbBRCtWANlQxe_lIcb2qVZA2H10H0SGfwoSDVpYPKpuLvUn68UAlsLrga2oK8GRmag4rZDQj2OPwWKs8AcF1DMfxGZ0u8FEL1CgMnCY2DBqrHa7GuCXsl6Ulrh3e9TM5Yndz90Wvdv7s_46J5pv8Uz6oOya9Dj-qbCnK6GnNTvj__Imyaa72eFG0MVAnAKstGS8W9_gCvhbDO7QFsacGcYdOofkKgJ-2QVFQITZj05a1-p7J3UnD9ETEOTvyqk1mduk8dMBNnR5UvVw-ntsjLgCvbF-Vg9PBkGL4zi641d1Fza9phOvOUUwqT0l6CeXDeBhXCTmfboUR8BjjnHbR8atWJ9wA8dE_6DDYE2bWYx8jWIHXM39BNYzflyYBgGIsUELgk25lG2Ke1tIls_Omtb2mpBOI1-BkTNnnmFEnKPUu_1c0wX5fabFRQUnEngLC9kvSwFZJxsa7yVZWNt3CivSt6Eao")),
        data: {"user_id": id},
      );

      return response.data;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }
}
