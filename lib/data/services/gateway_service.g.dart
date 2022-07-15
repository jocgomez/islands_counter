// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GatewayService implements GatewayService {
  _GatewayService(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://api.giphy.com/v1/gifs/search?api_key=ScbUUs6FI6ExbDYpXJSAc2oWQZmtgcLv&q=restaurant+lobby&limit=25&offset=0&rating=g&lang=en';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ResponseModel> getRestaurantInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
