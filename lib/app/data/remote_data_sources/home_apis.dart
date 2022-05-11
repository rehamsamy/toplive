import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/all_countries.dart';
import 'package:toplive/app/data/models/all_rooms.dart';
import 'package:toplive/app/data/models/my_room_model.dart';
import 'package:toplive/app/data/models/room_categories.dart';
import 'package:toplive/core/constants/app_const.dart';

class HomeApis {
  Future<MyRoomModel?> getMyRoom() async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.get(
        baseUrl + "my_room_details",
        options: Options(headers: getRequestHeaders()),
      );

      return MyRoomModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future<AllRoomsModel?> getAllRooms() async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.get(
        baseUrl + "all_rooms",
        options: Options(headers: getRequestHeaders()),
      );

      return AllRoomsModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future<RoomCategoriesModel?> getRoomCategories() async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.get(
        baseUrl + "room_categories",
        options: Options(headers: getRequestHeaders()),
      );

      return RoomCategoriesModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future<AllCountriesModel?> getAllCountries() async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.get(
        baseUrl + "countries",
        options: Options(headers: getRequestHeaders()),
      );

      return AllCountriesModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }
}
