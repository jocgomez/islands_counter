// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
      status: json['status'] as int,
      msg: json['msg'] as String,
      response_id: json['response_id'] as String,
    );

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'response_id': instance.response_id,
    };
