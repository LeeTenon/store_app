// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart()
  ..pid = json['pid'] as String
  ..name = json['name'] as String
  ..price = json['price'] as num
  ..picture_url = json['picture_url'] as String
  ..count = json['count'] as num;

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'pid': instance.pid,
      'name': instance.name,
      'price': instance.price,
      'picture_url': instance.picture_url,
      'count': instance.count,
    };
