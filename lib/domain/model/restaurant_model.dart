import 'package:json_annotation/json_annotation.dart';

part 'restaurant_model.g.dart';

@JsonSerializable()
class RestaurantModel {
  final String title;
  final Map<String, dynamic> images;

  RestaurantModel({
    required this.title,
    required this.images,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);

  String get getImageUrl => images['original']['url'] as String;
}
