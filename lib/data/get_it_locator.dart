import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islands_counter/data/services/gateway_service.dart';
import 'package:islands_counter/data/services/service_iteractor.dart';

GetIt locator = GetIt.instance;

class Locator {
  static Future<void> setUpLocator() async {
    final Dio dio = _getDioApiService();

    locator.registerSingleton<ServiceInteractor>(ServiceInteractor());
    locator.registerSingleton<GatewayService>(GatewayService(dio));
  }

  static Dio _getDioApiService() {
    final Dio dio = Dio();

    dio.options.receiveDataWhenStatusError = true;

    dio.options.connectTimeout = 30 * 1000;
    dio.options.receiveTimeout = 30 * 1000;

    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );

    return dio;
  }
}
