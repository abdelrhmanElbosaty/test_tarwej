// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_register_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRegisterInput _$ApiRegisterInputFromJson(Map<String, dynamic> json) =>
    ApiRegisterInput(
      userName: json['userName'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      fcmToken: json['fcmToken'] as String?,
      device: $enumDecode(_$DeviceEnumEnumMap, json['device']),
      platformDetails: json['platformDetails'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ApiRegisterInputToJson(ApiRegisterInput instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'phone': instance.phone,
      'password': instance.password,
      'fcmToken': instance.fcmToken,
      'device': _$DeviceEnumEnumMap[instance.device]!,
      'platformDetails': instance.platformDetails,
      'email': instance.email,
    };

const _$DeviceEnumEnumMap = {
  DeviceEnum.DESKTOP: 'DESKTOP',
  DeviceEnum.IOS: 'IOS',
  DeviceEnum.ANDROID: 'ANDROID',
};
