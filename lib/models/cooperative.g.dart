// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooperative.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cooperative _$CooperativeFromJson(Map<String, dynamic> json) => Cooperative()
  ..message = json['message'] as String
  ..responseCode = json['responseCode'] as int
  ..count = json['count'] as int
  ..cooperatives = (json['data'] as List<dynamic>)
      .map((e) => Cooperative.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CooperativeToJson(Cooperative instance) =>
    <String, dynamic>{
      'message': instance.message,
      'responseCode': instance.responseCode,
      'count': instance.count,
      'data': instance.cooperatives,
    };
