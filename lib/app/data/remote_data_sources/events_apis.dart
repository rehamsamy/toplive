import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_const.dart';
import '../models/diamonds_list.dart';

class EventsApi {
  Future<DiamondsListModel?> getJewelsCount() async {
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.get(
        baseUrl + "all_diamonds",
        options: Options(headers: getRequestHeaders()),
      );

      return DiamondsListModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }
}
