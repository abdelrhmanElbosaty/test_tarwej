
import 'package:flutter/material.dart';
import '../../domain/Entity/register/register_model.dart';

@immutable
abstract class RegisterEvent {}

class RegisterSubmit extends RegisterEvent {
  final RegisterModel input;

  RegisterSubmit(this.input);
}