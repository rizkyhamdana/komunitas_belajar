import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:komunitas_belajar/data/model/community_event.dart';

@immutable
class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CommunityEvent> listCommunityEvent;
  const HomeLoaded({required this.listCommunityEvent});
}

class HomeError extends HomeState {
  final String error;
  const HomeError({required this.error});
}
