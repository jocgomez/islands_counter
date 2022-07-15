import 'package:islands_counter/domain/model/meta_model.dart';
import 'package:islands_counter/domain/model/restaurant_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  final List<RestaurantModel> data;
  final MetaModel meta;

  ResponseModel({
    required this.data,
    required this.meta,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
