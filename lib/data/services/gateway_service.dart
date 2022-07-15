import 'package:dio/dio.dart';
import 'package:islands_counter/domain/model/response_model.dart';
import 'package:retrofit/http.dart';

part 'gateway_service.g.dart';

@RestApi(
  baseUrl:
      'https://api.giphy.com/v1/gifs/search?api_key=ScbUUs6FI6ExbDYpXJSAc2oWQZmtgcLv&q=restaurant+lobby&limit=25&offset=0&rating=g&lang=en',
)
abstract class GatewayService {
  factory GatewayService(Dio dio, {String baseUrl}) = _GatewayService;

  //Restaurant information search
  @GET('')
  Future<ResponseModel> getRestaurantInfo();
}
