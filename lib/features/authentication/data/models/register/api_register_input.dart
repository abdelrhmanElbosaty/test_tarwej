import 'package:json_annotation/json_annotation.dart';
import 'package:test_tarwej/features/authentication/domain/Entity/register/register_model.dart';

part 'api_register_input.g.dart';

@JsonSerializable()
class ApiRegisterInput {
  final String userName;
  final String phone;
  final String password;
  final String? fcmToken;
  final DeviceEnum device;
  final String? platformDetails;
  final String? email;

  ApiRegisterInput({
    required this.userName,
    required this.phone,
    required this.password,
    this.fcmToken,
    required this.device,
    this.platformDetails,
    this.email
  });

  factory ApiRegisterInput.fromJson(Map<String, dynamic> json) =>
      _$ApiRegisterInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiRegisterInputToJson(this);

  factory ApiRegisterInput.fromRegisterInput(RegisterModel input) {

    return ApiRegisterInput(
        userName: input.name,
        phone: input.phone,
        password: input.password,
        device: DeviceEnum.IOS
    );
  }
}

enum DeviceEnum { DESKTOP, IOS, ANDROID }