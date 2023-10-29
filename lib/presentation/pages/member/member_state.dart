import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:komunitas_belajar/data/model/member.dart';

@immutable
class MemberState extends Equatable {
  const MemberState();
  @override
  List<Object> get props => [];
}

class MemberInitial extends MemberState {}

class MemberLoading extends MemberState {}

class MemberLoaded extends MemberState {
  final List<Member> listMember;
  const MemberLoaded({required this.listMember});
}

class MemberError extends MemberState {
  final String error;
  const MemberError({required this.error});
}
