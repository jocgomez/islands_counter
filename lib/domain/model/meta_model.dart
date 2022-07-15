import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class MetaModel {
  final int status;
  final String msg;
  final String response_id;

  MetaModel({
    required this.status,
    required this.msg,
    required this.response_id,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}
