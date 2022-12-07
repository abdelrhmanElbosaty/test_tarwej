import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String name;
  final String? email;
  final String phone;
  final String password;

  const RegisterModel(this.name, this.email, this.phone, this.password);

  @override
  List<Object?> get props => [
    name,
    email,
    phone,
    password,
  ];
}