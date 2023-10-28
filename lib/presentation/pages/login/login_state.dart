import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginError extends LoginState {
  final String error;
  const LoginError({required this.error});
}
