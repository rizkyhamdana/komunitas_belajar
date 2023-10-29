import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:komunitas_belajar/data/model/about_us.dart';

@immutable
class AboutUsState extends Equatable {
  const AboutUsState();
  @override
  List<Object> get props => [];
}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoading extends AboutUsState {}

class AboutUsLoaded extends AboutUsState {
  final AboutUs aboutUs;
  const AboutUsLoaded({required this.aboutUs});
}

class AboutUsError extends AboutUsState {
  final String error;
  const AboutUsError({required this.error});
}
