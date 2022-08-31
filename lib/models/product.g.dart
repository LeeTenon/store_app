// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product()
  ..pid = json['pid'] as String
  ..name = json['name'] as String
  ..price = json['price'] as num
  ..picture_url = json['picture_url'] as String
  ..desc = json['desc'] as String;

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'pid': instance.pid,
      'name': instance.name,
      'price': instance.price,
      'picture_url': instance.picture_url,
      'desc': instance.desc,
    };
