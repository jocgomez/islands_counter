import 'package:islands_counter/data/get_it_locator.dart';
import 'package:islands_counter/data/services/gateway_service.dart';
import 'package:islands_counter/domain/model/response_model.dart';

class ServiceInteractor {
  Future<ResponseModel> getRestaurantInfo() async {
    final ResponseModel response =
        await locator<GatewayService>().getRestaurantInfo();

    return response;
  }
}
