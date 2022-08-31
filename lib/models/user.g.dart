// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..username = json['username'] as String
  ..avatar_url = json['avatar_url'] as String
  ..email = json['email'] as String
  ..gender = json['gender'] as String
  ..location = json['location'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'avatar_url': instance.avatar_url,
      'email': instance.email,
      'gender': instance.gender,
      'location': instance.location,
    };
